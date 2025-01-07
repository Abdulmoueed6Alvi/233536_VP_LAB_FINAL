using System;
using System.Collections.Generic;
using System.Data;
using System.ComponentModel;
using System.Windows;
using System.Windows.Controls;
using Microsoft.Data.SqlClient;

namespace VP_LAB_FINAL
{
    public partial class MainWindow : Window
    {
        private string connectionString = "Data Source=DESKTOP-9BMMS5L\\SQLEXPRESS;Initial Catalog=quizzes;Integrated Security=True;Trust Server Certificate=True";
        private List<Question> questionsList = new List<Question>();
        private int totalScore = 0;

        public MainWindow()
        {
            InitializeComponent();
            this.DataContext = this;  // Ensure DataContext is set for the window.
            LoadQuestions(); // Load questions on startup.
        }

        // Class to hold question details.
        public class Question : INotifyPropertyChanged
        {
            public string Category { get; set; }
            public string QuestionText { get; set; }
            public string OptionA { get; set; }
            public string OptionB { get; set; }
            public string OptionC { get; set; }
            public string OptionD { get; set; }
            public string CorrectOption { get; set; }

            private string _selectedOption;
            public string SelectedOption
            {
                get => _selectedOption;
                set
                {
                    if (_selectedOption != value)
                    {
                        _selectedOption = value;
                        OnPropertyChanged(nameof(SelectedOption));  // Notify when the option changes.
                    }
                }
            }

            // List of answer options (for ComboBox binding).
            public List<string> Options => new List<string> { OptionA, OptionB, OptionC, OptionD };

            public event PropertyChangedEventHandler PropertyChanged;

            protected void OnPropertyChanged(string propertyName)
            {
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
            }
        }

        // Load questions from the database.
        private void LoadQuestions()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string selectedCategory = (FilterComboBox.SelectedItem as ComboBoxItem)?.Content?.ToString() ?? "All";

                    string query = selectedCategory == "All"
                        ? "SELECT category, question, option_a, option_b, option_c, option_d, correct_option FROM questionss"
                        : "SELECT category, question, option_a, option_b, option_c, option_d, correct_option FROM questionss WHERE category = @Category";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        if (selectedCategory != "All")
                        {
                            cmd.Parameters.AddWithValue("@Category", selectedCategory);
                        }

                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        questionsList.Clear();
                        foreach (DataRow row in dt.Rows)
                        {
                            questionsList.Add(new Question
                            {
                                Category = row["category"].ToString(),
                                QuestionText = row["question"].ToString(),
                                OptionA = row["option_a"].ToString(),
                                OptionB = row["option_b"].ToString(),
                                OptionC = row["option_c"].ToString(),
                                OptionD = row["option_d"].ToString(),
                                CorrectOption = row["correct_option"].ToString(),
                                SelectedOption = ""
                            });
                        }

                        // Refresh DataGrid only if initialized.
                        if (QuizDataGrid != null)
                        {
                            QuizDataGrid.ItemsSource = null;
                            QuizDataGrid.ItemsSource = questionsList;  // Bind the questions list to the DataGrid.
                        }
                        else
                        {
                            MessageBox.Show("DataGrid is not initialized. Please check XAML configuration.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error loading questions: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        // Event handler for Submit Button.
        private void SubmitButton_Click(object sender, RoutedEventArgs e)
        {
            totalScore = 35;

            // Iterate through the questions list and calculate the total score.
            foreach (var question in questionsList)
            {
                if (!string.IsNullOrEmpty(question.SelectedOption) && question.SelectedOption == question.CorrectOption)
                {
                    totalScore += 5; // 5 points for correct answer.
                }
            }

            // Calculate percentage score and display message.
            double percentage = questionsList.Count > 0 ? ((double)totalScore / (questionsList.Count * 5)) * 100 : 0;
            MessageBox.Show($"Your total score is: {totalScore} out of {questionsList.Count * 5} ({percentage:0.00}%)", "Quiz Result", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        // Event handler for Reset Button.
        private void ResetButton_Click(object sender, RoutedEventArgs e)
        {
            foreach (var question in questionsList)
            {
                question.SelectedOption = ""; // Clear selected options.
            }

            // Refresh DataGrid.
            QuizDataGrid.ItemsSource = null;
            QuizDataGrid.ItemsSource = questionsList;
        }

        // Event handler for Exit Button.
        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown(); // Close the application.
        }

        // Event handler for Show Button (Refresh DataGrid).
        private void show_Click(object sender, RoutedEventArgs e)
        {
            LoadQuestions(); // Reload the questions based on filter selection.
        }

        // Selection changed event for ComboBox inside DataGrid to update selected answers.
        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (sender is ComboBox comboBox && comboBox.SelectedItem is string selectedAnswer)
            {
                MessageBox.Show($"You selected: {selectedAnswer}", "Selection Changed", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }
    }
}
