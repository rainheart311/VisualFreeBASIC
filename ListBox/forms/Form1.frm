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
Width=420
Height=342
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

[ListBox]
Name=List1
Index=-1
Style=0 - 单选
BStyle=3 - 凹边框
OwnDraw=0 - 系统绘制
ItemHeight=15
HasString=False
Sorted=False
NoHeight=True
MultiColumn=False
Enabled=True
Visible=True
ForeColor=SYS,8
BackColor=SYS,5
Font=宋体,9
Left=8
Top=50
Width=164
Height=205
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False
AcceptFiles=False

[ListBox]
Name=List2
Index=-1
Style=0 - 单选
BStyle=3 - 凹边框
OwnDraw=0 - 系统绘制
ItemHeight=15
HasString=False
Sorted=False
NoHeight=True
MultiColumn=False
Enabled=True
Visible=True
ForeColor=SYS,8
BackColor=SYS,5
Font=宋体,9
Left=232
Top=50
Width=164
Height=205
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
Caption=>>
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=187
Top=117
Width=31
Height=24
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Button]
Name=Command2
Index=-1
Caption=<<
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=187
Top=155
Width=31
Height=24
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Label]
Name=Label1
Index=-1
Style=0 - 无边框
Caption=Label1
Enabled=True
Visible=True
ForeColor=SYS,8
BackColor=SYS,25
Font=宋体,9
TextAlign=0 - 左对齐
Prefix=True
Ellipsis=False
Left=12
Top=12
Width=385
Height=32
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
ToolTip=
ToolTipBalloon=False

[Button]
Name=Command3
Index=-1
Caption=添加子项
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=59
Top=266
Width=66
Height=27
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Button]
Name=Command4
Index=-1
Caption=删除子项
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=129
Top=267
Width=66
Height=27
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Button]
Name=Command5
Index=-1
Caption=清空列表
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=200
Top=267
Width=66
Height=27
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Button]
Name=Command6
Index=-1
Caption=子项数据
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=272
Top=269
Width=66
Height=27
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
    Label1.Caption = "双击或点按键将列表1的数据添加到列表2，并删除列表1中的数据" & vbCrLf & _
    "或将列表2的数据添加到列表1，并删除列表2中的数据"
    
    List1.AddItem "苹果"
    List1.ItemData(0) = 0
    List1.AddItem "橘子"
    List1.ItemData(1) = 1
    List1.AddItem "草莓"
    List1.ItemData(2) = 2
    List1.AddItem "樱桃"
    List1.ItemData(3) = 3
    List1.AddItem "石头"
    List1.ItemData(4) = 4
    List1.AddItem "芒果"
    List1.ItemData(5) = 5
    List1.AddItem "牛奶"
    List1.ItemData(6) = 6
    List1.AddItem "白菜"
    List1.ItemData(7) = 7
    List1.AddItem "萝卜"
    List1.ItemData(8) = 8
    List1.ForeColor = &H0000FF     
End Sub

Sub Form1_Command1_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    List2.AddItem List1.List(List1.ListIndex)
    List1.RemoveItem List1.ListIndex 
End Sub

Sub Form1_Command2_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    List1.AddItem List2.List(List2.ListIndex)
    List2.RemoveItem List2.ListIndex     
End Sub

Sub Form1_List2_LBN_DblClk(hWndForm As hWnd, hWndControl As hWnd)  '双击
    Command2.Click
End Sub

Sub Form1_List1_LBN_DblClk(hWndForm As hWnd, hWndControl As hWnd)  '双击
    Command1.Click
End Sub

Sub Form1_Command3_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    List1.AddItem "西瓜"
End Sub

Sub Form1_Command4_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    Dim item As Long = iif(List2.ListIndex = -1,0,List2.ListIndex)
    List1.RemoveItem item 
End Sub

Sub Form1_Command5_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    List1.Clear
End Sub

Sub Form1_Command6_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    For i As Long = 0 To List1.ListCount - 1
        PrintA List1.ItemData(i)  
    Next i  
End Sub


















