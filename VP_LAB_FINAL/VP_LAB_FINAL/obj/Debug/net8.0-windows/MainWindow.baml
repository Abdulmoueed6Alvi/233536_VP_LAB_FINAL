   M S B A M L   `   `   `  ����G  CVP_LAB_FINAL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:VP_LAB_FINALVP_LAB_FINAL  5   	       VP_LAB_FINAL.MainWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ,localclr-namespace:VP_LAB_FINAL     5   	     � Title$  Quiz Application��5   	   $	��500��6"   $	��800��6/   .��5
      � $��10q�6    � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   ��  �� Orientation$ 
Horizontal=�6   $��0��6.   $��	0,10,0,10q�6;   .+�5      �� $��Filter by Category:��6   $��Center=�63   $
��Bold"�6N   $��0,0,10,0q�6`   �� 5      -   5         ��Name$ FilterComboBox��5      $	��200��6/   $
��Left=�6;   .@�5      �� $	��All��6    �� 
IsSelected$
 True��6-   �� 5      $
��Math��6   �� 5      $��Science��6   �� 5      $��History��6   �� 5      $��General Knowledge��6   5      5      &   System.Windows.Controls.DataGrid  5!   
   -   5          Name$ QuizDataGrid��5!      $��1��6)   $��0,0,0,10q�66   ���#FFFFFF   AutoGenerateColumns$ False��5"         CanUserAddRows$ False��6'      
IsReadOnly$ False��5#      ���#BDBDBD	   AlternatingRowBackground	 �#E8EAF6���#4A148C
   SelectionMode$
 Single=�5%         Columns 5&      0  *System.Windows.Controls.DataGridTextColumn  5(      ,  &System.Windows.Controls.DataGridColumn   Header$ Question��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ 3* 6X   1  +System.Windows.Controls.DataGridBoundColumn   Binding 67   �� *QuestionText+6X   4  .System.Windows.Controls.DataGridTemplateColumn  5+      $ Your Answer��6)   $ 2* 6>      CellTemplate 5,      �� 5-      .R�5.      �� -   5        ��5.   '   �� *	Options+ �� SelectedItem 5/      �� *SelectedOption+ �� Mode$ TwoWay=�50      51      53      55      �� 5;   
   $��2��6   $ Vertical=�6"   $��Stretch=�69   $��0,0,0,0q�6W   .+�5<      � -   5         �Name$ QuizProgressBar��5<      $��20��63   $��
10,0,10,10q�6?    � Value$ 0Q�6S    � Minimum$ 0Q�6]    � Maximum$	 100Q�6i   �� 5?      $ 
Horizontal=�6   $��Center=�62   $��0,10,0,0q�6O   .+�5@      �� -   5         ��Name$ SubmitButton��5@      $��Submit��6/   $	��100��6@   $��10q�6L   ���#4CAF50
�������6�   �� 5A      -   5        $ ResetButton��5A      $��Reset��6.   $	��100��6>   $��10q�6J   ���#F44336
�������6~   �� 5B      -   5        $ 
ExitButton��5B      $
��Exit��6-   $	��100��6<   $��10q�6H   ���#FF5722
�������6|   �� 5C      -   5        $
 show��5C      $
��Show��6'   $	��100��66   $��10q�6B   ���#2196F3
�������6v   5D      5E      5F      5G      