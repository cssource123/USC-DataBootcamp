Attribute VB_Name = "Module3"
Sub Stocks()
    Dim ticker As String
    Dim Volume_Total As Double
    Dim Total_Table_Row As Long
    Total_Table_Row = 2
    For num = 2 To 797711
        If Cells(num + 1, 1).Value <> Cells(num, 1).Value Then
            ticker = Cells(num, 1).Value
            Volume_Total = Volume_Total + Cells(num, 7).Value
            Range("I" & Total_Table_Row).Value = ticker
            Range("J" & Total_Table_Row).Value = Volume_Total
            Total_Table_Row = Total_Table_Row + 1
            Volume_Total = 0
        Else
            Volume_Total = Volume_Total + Cells(num, 7).Value
        End If
    Next num
    
    
End Sub
