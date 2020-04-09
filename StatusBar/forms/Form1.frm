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
Width=495
Height=300
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

[StatusBar]
Name=Status1
Status=Write By RainHeart QQ1493446087012002020-04-09 08:30:30010最后一个窗格010
SizeGrip=True
ToolTips=True
Enabled=True
Visible=True
Font=宋体,9
BackColor=SYS,15
MinHeight=0
Tag=
Tab=True

[Button]
Name=Command1
Index=-1
Caption=添加窗格
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=197
Top=116
Width=73
Height=28
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Button]
Name=Command2
Index=-1
Caption=移除窗格
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=119
Top=116
Width=73
Height=28
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Button]
Name=Command3
Index=-1
Caption=修改文本
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=277
Top=116
Width=73
Height=28
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Timer]
Name=Timer1
Index=-1
Interval=1000
Enabled=True
Left=367
Top=118
Tag=


[AllCode]
'这是标准的工程模版，你也可做自己的模版。
'写好工程，复制全部文件到VFB软件文件夹里【template】里即可，子文件夹名为 VFB新建工程里显示的名称
'快去打造属于你自己的工程模版吧。

Sub Form1_Command2_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    Status1.RemovePane 0
End Sub

Sub Form1_Command1_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    Status1.AddPane "增加的窗格","窗格提示",0,-1 '新增的窗格添加在原有窗格的后面，如果是最末尾一个，则需要设置长度为-1，表示后面的长度都是该窗格的。
End Sub

Sub Form1_Command3_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    Status1.Text(0) = "新的窗格文本"
End Sub

Sub Form1_Timer1_WM_Timer(hWndForm As hWnd, wTimerID As Long)  '定时器
    Status1.Text(1) = NowString  '用定时器刷新时间
End Sub

Function Form1_Status1_NM_Click(hWndForm As hWnd, hWndControl As hWnd,pNM As NMMOUSE) As LResult  '用户已在控件单击鼠标左键
    AfxMsg "您单击了状态栏的第" & pNM.dwItemSpec + 1 & "个窗格"
    Function = FALSE ' 返回 TRUE 表示已处理了鼠标点击，不需要系统处理。返回 FALSE 允许系统默认处理点击。
End Function











