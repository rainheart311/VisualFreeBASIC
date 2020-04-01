#VisualFreeBasic_Form#  Version=5.2.9
Locked=-1

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
Width=421
Height=281
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

[Button]
Name=Command1
Index=-1
Caption=按键示例
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=78
Top=15
Width=247
Height=78
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Button]
Name=Command2
Index=-1
Caption=修改标题
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=47
Top=130
Width=87
Height=34
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Button]
Name=Command3
Index=-1
Caption=改变使能
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=164
Top=133
Width=87
Height=34
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Button]
Name=Command4
Index=-1
Caption=改变显示
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=285
Top=132
Width=87
Height=34
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Button]
Name=Command5
Index=-1
Caption=移动按钮
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=83
Top=184
Width=87
Height=34
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Button]
Name=Command6
Index=-1
Caption=软件单击
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=226
Top=185
Width=87
Height=34
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

Sub Form1_Command1_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    AfxMsg "你单击我啦!   单击时间:" & Time,"提示"
End Sub

Sub Form1_Command2_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    Command1.Caption = "新的标题"    
End Sub

Sub Form1_Command3_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    if Command1.Enabled Then
        Command1.Enabled = False
    Else
        Command1.Enabled = True 
    End If
End Sub

Sub Form1_Command4_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    if Command1.Visible Then
        Command1.Visible = False
    Else
        Command1.Visible = True 
    End If    
End Sub

Sub Form1_Command5_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    Command1.Move 0,0,100,40
End Sub

Sub Form1_Command6_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    Command1.Click
End Sub












