#VisualFreeBasic_Form#  Version=5.2.10
Locked=0

[Form]
Name=Form1
ClassStyle=CS_VREDRAW,CS_HREDRAW,CS_DBLCLKS
ClassName=
WinStyle=WS_THICKFRAME,WS_CAPTION,WS_SYSMENU,WS_MINIMIZEBOX,WS_MAXIMIZEBOX,WS_CLIPSIBLINGS,WS_CLIPCHILDREN,WS_VISIBLE,WS_EX_WINDOWEDGE,WS_EX_CONTROLPARENT,WS_EX_LEFT,WS_EX_LTRREADING,WS_EX_RIGHTSCROLLBAR,WS_POPUP,WS_SIZEBOX
Style=3 - 常规窗口
Icon=
Caption=Form1
StartPosition=1 - 屏幕中心
WindowState=0 - 正常
Enabled=True
Repeat=False
Left=0
Top=0
Width=349
Height=262
TopMost=False
Child=False
MdiChild=False
TitleBar=True
SizeBox=True
SysMenu=True
MaximizeBox=True
MinimizeBox=True
Help=False
Hscroll=False
Vscroll=False
MinWidth=0
MinHeight=0
MaxWidth=0
MaxHeight=0
NoActivate=False
MousePass=False
TransPer=0
TransColor=SYS,25
BackColor=SYS,15
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False
AcceptFiles=False

[ComboBox]
Name=Combo1
Index=-1
Style=0 - 标签和下拉框
OwnDraw=0 - 系统绘制
ItemHeight=15
HasString=False
Sorted=False
NoHeight=False
AutoHscroll=True
MaxLength=0
Uppercase=False
Lowercase=False
Enabled=True
Visible=True
ForeColor=SYS,8
BackColor=SYS,5
Font=宋体,9
Left=13
Top=22
Width=142
Height=187
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False
AcceptFiles=False

[ComboBox]
Name=Combo2
Index=-1
Style=1 - 文本框和下拉框
OwnDraw=0 - 系统绘制
ItemHeight=15
HasString=False
Sorted=False
NoHeight=False
AutoHscroll=True
MaxLength=0
Uppercase=False
Lowercase=False
Enabled=True
Visible=True
ForeColor=SYS,8
BackColor=SYS,5
Font=宋体,9
Left=13
Top=53
Width=142
Height=187
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False
AcceptFiles=False

[ComboBox]
Name=Combo3
Index=-1
Style=2 - 文本框和列表框
OwnDraw=0 - 系统绘制
ItemHeight=15
HasString=False
Sorted=False
NoHeight=False
AutoHscroll=True
MaxLength=0
Uppercase=False
Lowercase=False
Enabled=True
Visible=True
ForeColor=SYS,8
BackColor=SYS,5
Font=宋体,9
Left=185
Top=24
Width=142
Height=187
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False
AcceptFiles=False

[Button]
Name=Command1
Index=-1
Caption=添加子项
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=12
Top=93
Width=80
Height=33
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Button]
Name=Command2
Index=-1
Caption=删除子项
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=93
Top=93
Width=80
Height=33
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Button]
Name=Command3
Index=-1
Caption=清空所有
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=94
Top=130
Width=80
Height=33
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Button]
Name=Command4
Index=-1
Caption=子项数据
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=12
Top=131
Width=80
Height=33
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False


[AllCode]
'这是标准的工程模版，你也可做自己的模版。
'写好工程，复制全部文件到VFB软件文件夹里【template】里即可，子文件夹名为 VFB新建工程里显示的名称
'快去打造属于你自己的工程模版吧。

Sub Form1_Shown(hWndForm As hWnd,UserData As Integer)  '窗口完全显示后。UserData 来自显示窗口最后1个参数。
    For i As Long = 1 To 16
        Combo1.AddItem "COM" & i      '
        
        Combo2.AddItem "子项" & i
        Randomize '随机数种子
        Combo2.ItemData(i -1) = int(Rnd * 100) - 1  '随机数  
        
        Combo3.AddItem int(Rnd * 100) - 1  '随机数  
    Next
    Combo1.ListIndex = 0  '设置选中
    Combo2.ListIndex = 0  '设置选中
End Sub

Sub Form1_Combo1_CBN_SelChange(hWndForm As hWnd, hWndControl As hWnd)  '列表框中更改当前选择时
    Printa "Combo1当前选中" & Combo1.Text
End Sub

Sub Form1_Combo2_CBN_SelChange(hWndForm As hWnd, hWndControl As hWnd)  '列表框中更改当前选择时
    Printa "Combo2当前选中" & Combo2.Text
End Sub

Sub Form1_Command1_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    Combo1.InsertItem 0, "COM0" 
    Combo2.AddItem "子项" & Combo2.ListCount + 1   
End Sub

Sub Form1_Command2_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    Combo1.RemoveItem 0
    Combo2.RemoveItem iif(Combo2.ListIndex = -1,0, Combo2.ListIndex)
End Sub

Sub Form1_Command4_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    For i As Long = 0 To Combo2.ListCount - 1
        PrintA Combo2.ItemData(i)
    Next

End Sub

Sub Form1_Command3_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    Combo1.Clear
    Combo2.Clear
    Combo3.Clear
End Sub












