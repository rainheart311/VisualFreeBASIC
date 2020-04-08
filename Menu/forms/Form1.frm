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

[TopMenu]
Name=TopMenu1
Menu=文件mnuFile0-10{新建mnuFileNew0-10打开mnuFileOpen0-10保存mnuFileSave0-10-Form1_TopMenu1_10-10退出mnuExit0-10}
Tag=

[PopupMenu]
Name=PopupMenu1
Index=-1
Menu=剪切mnuCut0-10复制mnuCopy0-10粘贴mnuPaste0-10
Left=136
Top=68
Tag=


[AllCode]
'这是标准的工程模版，你也可做自己的模版。
'写好工程，复制全部文件到VFB软件文件夹里【template】里即可，子文件夹名为 VFB新建工程里显示的名称
'快去打造属于你自己的工程模版吧。

Sub Form1_TopMenu1_WM_Command(hWndForm As hWnd,wID As ULong)  '点击了菜单项
    Select Case wID
    Case mnuFile ' 文件       '不用
    Case mnuFileNew ' 新建
        AfxMsg "选择了【新建】"
    Case mnuFileOpen ' 打开
        AfxMsg "选择了【打开】"
    Case mnuFileSave ' 保存
        AfxMsg "选择了【保存】"
    Case mnuExit ' 退出
        Form1.Close  '关闭窗体
    End Select

End Sub

Sub Form1_WM_ContextMenu(hWndForm As hWnd, xPos As Long, yPos As Long)  '单击鼠标右键，通常用于弹出菜单
    PopupMenu1.PopupMenu(hWndForm,xPos,yPos)
End Sub

Sub Form1_PopupMenu1_WM_Command(hWndForm As hWnd,wID As ULong)  '点击了菜单项
    Select Case wID
    Case mnuCut ' 剪切
        AfxMsg "选择了【剪切】"
    Case mnuCopy ' 复制
        AfxMsg "选择了【复制】"
    Case mnuPaste ' 粘贴
        AfxMsg "选择了【粘贴】"
    End Select

End Sub





