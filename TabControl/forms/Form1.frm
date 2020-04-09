#VisualFreeBasic_Form#  Version=5.2.10
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
Width=788
Height=537
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

[TabControl]
Name=TabControl1
Index=-1
Style=0 - 标签在顶部
FixedWidth=False
Multiline=False
Buttons=False
NoScroll=False
MultiSelect=False
FlatButton=False
IconLeft=False
LabelLeft=False
HotTrack=False
FocusButton=False
FocusNever=False
ToolTips=False
OwnDraw=False
HeaderTopPadding=4
HeaderSidePadding=4
TabHeight=22
TabWidth=40
Enabled=True
Visible=True
Left=7
Top=9
Width=759
Height=438
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
Caption=添加选项卡
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=11
Top=458
Width=77
Height=32
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Button]
Name=Command2
Index=-1
Caption=删除选项卡
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=92
Top=459
Width=77
Height=32
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Button]
Name=Command3
Index=-1
Caption=清除所有
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=175
Top=460
Width=77
Height=32
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Button]
Name=Command4
Index=-1
Caption=当前选项
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=259
Top=460
Width=77
Height=32
Layout=0 - 不锚定
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False

[Button]
Name=Command5
Index=-1
Caption=修改文本
Enabled=True
Visible=True
Default=False
OwnDraw=False
MultiLine=False
Font=宋体,9
Left=343
Top=461
Width=77
Height=32
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

Sub Form1_WM_Create(hWndForm As hWnd,UserData As Integer)  '完成创建窗口及所有的控件后，此时窗口还未显示。注：自定义消息里 WM_Create 此时还未创建控件和初始赋值。
    TabControl1.AddTab "Tab1",cast(LPARAM,frmTab0.Show(hWndForm))  '添加选项卡，同时将绑定的窗体句柄保存到子项参数里。
    TabControl1.AddTab "Tab2",Cast(LPARAM,frmTab1.Show(hWndForm))
End Sub

Sub SetTabFormPos(hWndForm As hWnd,nTabPage As long)
    Dim rc As RECT
    GetWindowRect TabControl1.hWnd, @rc  '获取Tab控件大小
    TabCtrl_AdjustRect(TabControl1.hWnd, 0, @rc) '计算显示的区域大小，存在rc里
    MapWindowPoints HWND_DESKTOP, hWndForm, Cast(LPPOINT, @rc), 2  '屏幕坐标转换成主窗体坐标
    SetWindowPos Cast(HWND, TabControl1.ItemParam(nTabPage)), HWND_TOP, rc.Left, rc.Top, rc.Right - rc.Left, rc.Bottom - rc.Top, 0  '调整窗体位置  
End Sub

Sub Form1_Shown(hWndForm As hWnd,UserData As Integer)  '窗口完全显示后。UserData 来自显示窗口最后1个参数。
    TabControl1.Selected = 0     '需要显示的标签页
    frmTab0.Visible = True       '需要显示的窗体
    SetTabFormPos(hWndForm, 0)   '调整窗体位置
End Sub

Sub Form1_TabControl1_TCN_SelChange(hWndForm As hWnd, hWndControl As hWnd,pNMHDR As NMHDR )  '选择了列表
    SetTabFormPos(hWndForm, TabControl1.Selected)                                  '调整窗体位置
    ShowWindow Cast(HWND, TabControl1.ItemParam(TabControl1.Selected)), SW_SHOW    '显示窗体
    SetFocus pNMHDR.hwndFrom                                                       '设置焦点
End Sub

Function Form1_TabControl1_TCN_SelChanging(hWndForm As hWnd, hWndControl As hWnd,pNMHDR As NMHDR ) As LResult  '选择的项将要被切换至另一个
    ShowWindow Cast(HWND, TabControl1.ItemParam(TabControl1.Selected)), SW_HIDE   '隐藏当前窗体
    Function = False '允许更改选择。返回 TRUE 将不允许更改选择
End Function

Sub Form1_Command1_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    if IsWindow(frmTab2.hWnd) Then Exit sub  '如果创建了窗体，则不再重复创建
    TabControl1.AddTab "新选项卡",Cast(LPARAM,frmTab2.Show(hWndForm))
End Sub

Sub Form1_Command2_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    TabControl1.Remove TabControl1.Selected
    TabControl1.Focus = 0                    '把焦点默认给第1个选项卡
End Sub

Sub Form1_Command3_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击 
    ShowWindow Cast(HWND, TabControl1.ItemParam(TabControl1.Selected)), SW_HIDE   '需要先隐藏当前窗体
    TabControl1.RemoveAll                                                         '再清除选项卡标签
End Sub

Sub Form1_Command4_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    AfxMsg "当前选中的是第" & TabControl1.Selected + 1 & "个选项卡标签"
End Sub

Sub Form1_Command5_BN_Clicked(hWndForm As hWnd, hWndControl As hWnd)  '单击
    TabControl1.Text(TabControl1.Selected) = "新标签"
End Sub















