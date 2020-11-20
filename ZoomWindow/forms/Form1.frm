#VisualFreeBasic_Form#  Version=5.4.10
Locked=0

[Form]
Name=Form1
ClassStyle=CS_VREDRAW,CS_HREDRAW,CS_DBLCLKS
ClassName=
WinStyle=WS_VISIBLE,WS_EX_CONTROLPARENT,WS_EX_LEFT,WS_EX_LTRREADING,WS_EX_RIGHTSCROLLBAR,WS_BORDER,WS_CAPTION,WS_SYSMENU,WS_MAXIMIZEBOX,WS_MINIMIZEBOX,WS_CLIPSIBLINGS,WS_CLIPCHILDREN,WS_POPUP,WS_SIZEBOX
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
Shadow=0 - 无阴影
BackColor=SYS,15
MousePointer=0 - 默认
Tag=
Tab=True
ToolTip=
ToolTipBalloon=False
AcceptFiles=False

[Timer]
Name=Timer1
Index=-1
Interval=100
Enabled=True
Left=349
Top=208
Tag=

[PopupMenu]
Name=PopupMenu1
Index=-1
Menu=放大100%mnu_Zoom1000-10放大150%mnu_Zoom1500-10放大200%mnu_Zoom200-1-10放大300%mnu_Zoom3000-10放大400%mnu_Zoom4000-10放大500%mnu_Zoom5000-10放大600%mnu_Zoom6000-10
Left=104
Top=104
Tag=


[AllCode]
'这是标准的工程模版，你也可做自己的模版。
'写好工程，复制全部文件到VFB软件文件夹里【template】里即可，子文件夹名为 VFB新建工程里显示的名称
'快去打造属于你自己的工程模版吧。

Type SizeRect
    Left    As Long
    Top     As Long
    Width   As Long
    Height  As Long
End Type


Dim Shared m_OldX As Long ,m_OldY As Long
Dim Shared mfScale As Single = 2

Sub Form1_Timer1_WM_Timer(hWndForm As hWnd, wTimerID As Long)  '定时器
    Static lElapsed As Long
    Dim pt As POINT
    
    If Me.WindowState <> 1 Then  '不是最小化
        lElapsed = lElapsed + Timer1.Interval
        GetCursorPos(@pt)  
        If (pt.x <> m_OldX) OrElse (pt.y <> m_OldY) OrElse (lElapsed >= 250) Then
            DoZoom(pt) 
            'Me.Move pt.x,pt.y  '如果要随窗口移动，则放大倍数要增加，并且跟鼠标保持一定距离，否则会把显示窗口的左上角也显示进去 
            lElapsed = 0
        End If 
        m_OldX = pt.x
        m_OldY = pt.y
    End If
End Sub

Sub DoZoom(ptMouse As Point)
    Dim lRet        As Long
    Dim lTemp       As Long
    Dim hWndDesk    As HWND
    Dim hDCDesk     As HDC
    Dim sizSrce     As SizeRect
    Dim sizDest     As SizeRect

    'Get the Desktop DC
    hWndDesk = GetDesktopWindow()
    hDCDesk = GetDC(hWndDesk)
                       
    'Setup the Destination size for StretchBlt.
    With sizDest
        .Left = 0
        .Top = 0
        .Width = form1.scaleWidth
        .Height = form1.scaleHeight
    End With
    
    'Setup the Source size for StretchBlt.
    With sizSrce
        .Left = ptMouse.x - Int(sizDest.Width / mfScale / 2)
        .Top = ptMouse.y - Int(sizDest.Height / mfScale / 2)
        .Width = sizDest.Width / mfScale
        .Height = sizDest.Height / mfScale

        lTemp = Int(.Width * mfScale)  '(Source.Width * mfScale must= sizDest.Width)
        If lTemp > sizDest.Width Then
            sizDest.Width = lTemp
        ElseIf lTemp < sizDest.Width Then
            .Width = .Width + 1
            sizDest.Width = lTemp + mfScale
        End If
        'Adjust the Height, if needed.
        lTemp = Int(.Height * mfScale) '(sizSrce.Height * mfScale must= sizDest.Height)
        If lTemp > sizDest.Height Then                                                                                                     
            sizDest.Height = lTemp
        ElseIf lTemp < sizDest.Height Then
            .Height = .Height + 1
            sizDest.Height = lTemp + mfScale
        End If
    End With
   
    Dim zoomdc As HDC = GetDC(form1.hWnd) '获取显示窗体的DC
    Dim tmpdc As HDC = CreateCompatibleDC(zoomdc) '创建一个跟显示窗体一样的内存DC
    Dim hbmp As HBITMAP = CreateCompatibleBitmap(zoomdc ,form1.scaleWidth ,form1.scaleHeight)  '创建一个跟显示窗体一样大小的位图（用来在上面画图）
    dim oldbmp As HBITMAP = SelectObject(tmpdc,hbmp) '将位图载入内存DC
    
    BitBlt(tmpdc, 0, 0, sizSrce.Width, sizSrce.Height, hDCDesk, sizSrce.Left, sizSrce.Top, SRCCOPY)  '&H40CC0020 '拷贝桌面到内存DC
    StretchBlt(zoomdc, sizDest.Left, sizDest.Top, sizDest.Width, sizDest.Height, tmpdc, 0, 0, sizSrce.Width, sizSrce.Height, SRCCOPY)  '拷贝内DC的图片到窗体
    DrawIcon zoomdc ,sizDest.Width / 2 - 10 ,sizDest.Height / 2 - 10 ,LoadCursor(NULL,IDC_ARROW)  '在图片中心画鼠标
    
    SelectObject(tmpdc,oldbmp) '恢复
    DeleteBitmap(hbmp)         '删除位图
    DeleteDC(tmpdc)            '删除内存DC
    ReleaseDC(form1.hWnd,zoomdc) '释放窗体DC（和getdc配对）
    ReleaseDC(hWndDesk, hDCDesk) '释放桌面DC
End Sub

Function Form1_Custom(hWndForm As hWnd, wMsg As UInteger, wParam As wParam, lParam As lParam) As LResult  '自定义消息（全部消息），在其它事件处理后才轮到本事件。 
    Select Case wMsg 
    Case WM_SYSKEYDOWN
        if wParam = VK_ESCAPE Then 
            Me.Close
        End If
    End Select 
    Function = FALSE ' 若不想系统继续处理此消息，则应返回 TRUE （俗称吃掉消息）。
End Function

Sub Form1_Shown(hWndForm As hWnd,UserData As Integer)  '窗口完全显示后。UserData 来自显示窗口最后1个参数。
    Me.Caption = "ZoomWindow - 放大倍数：" & mfScale * 100 & "%" 
End Sub

Sub Form1_WM_RButtonDown(hWndForm As hWnd, MouseFlags As Long, xPos As Long, yPos As Long)  '按下鼠标右键
   'MouseFlags  MK_CONTROL   MK_LBUTTON     MK_MBUTTON     MK_RBUTTON    MK_SHIFT     MK_XBUTTON1       MK_XBUTTON2 
   ''           CTRL键按下   鼠标左键按下   鼠标中键按下   鼠标右键按下  SHIFT键按下  第一个X按钮按下   第二个X按钮按下
   '检查什么键按下用  If (MouseFlags And MK_CONTROL)<>0 Then CTRL键按下 
   Dim pt As POINT
   GetCursorPos(@pt)
   PopupMenu1.PopupMenu hWndForm,pt.x,pt.y 
End Sub

Sub Form1_PopupMenu1_WM_Command(hWndForm As hWnd,wID As ULong)  '点击了菜单项
    Select Case wID
    Case mnu_Zoom100 ' 放大100%
        PopupMenu1.Check(mnu_Zoom100) = True 
        PopupMenu1.Check(mnu_Zoom150) = False
        PopupMenu1.Check(mnu_Zoom200) = False
        PopupMenu1.Check(mnu_Zoom300) = False
        PopupMenu1.Check(mnu_Zoom400) = False
        PopupMenu1.Check(mnu_Zoom500) = False
        PopupMenu1.Check(mnu_Zoom600) = False
        mfScale = 1
    Case mnu_Zoom150 ' 放大150%
        PopupMenu1.Check(mnu_Zoom100) = False
        PopupMenu1.Check(mnu_Zoom150) = True
        PopupMenu1.Check(mnu_Zoom200) = False
        PopupMenu1.Check(mnu_Zoom300) = False
        PopupMenu1.Check(mnu_Zoom400) = False
        PopupMenu1.Check(mnu_Zoom500) = False
        PopupMenu1.Check(mnu_Zoom600) = False 
        mfScale = 1.5
    Case mnu_Zoom200 ' 放大200%
        PopupMenu1.Check(mnu_Zoom100) = False
        PopupMenu1.Check(mnu_Zoom150) = False
        PopupMenu1.Check(mnu_Zoom200) = True
        PopupMenu1.Check(mnu_Zoom300) = False
        PopupMenu1.Check(mnu_Zoom400) = False
        PopupMenu1.Check(mnu_Zoom500) = False
        PopupMenu1.Check(mnu_Zoom600) = False  
        mfScale = 2
    Case mnu_Zoom300 ' 放大300%
        PopupMenu1.Check(mnu_Zoom100) = False
        PopupMenu1.Check(mnu_Zoom150) = False
        PopupMenu1.Check(mnu_Zoom200) = False
        PopupMenu1.Check(mnu_Zoom300) = True
        PopupMenu1.Check(mnu_Zoom400) = False
        PopupMenu1.Check(mnu_Zoom500) = False
        PopupMenu1.Check(mnu_Zoom600) = False
        mfScale = 3
    Case mnu_Zoom400 ' 放大400%
        PopupMenu1.Check(mnu_Zoom100) = False
        PopupMenu1.Check(mnu_Zoom150) = False
        PopupMenu1.Check(mnu_Zoom200) = False
        PopupMenu1.Check(mnu_Zoom300) = False
        PopupMenu1.Check(mnu_Zoom400) = True
        PopupMenu1.Check(mnu_Zoom500) = False
        PopupMenu1.Check(mnu_Zoom600) = False
        mfScale = 4
    Case mnu_Zoom500 ' 放大500%
        PopupMenu1.Check(mnu_Zoom100) = False
        PopupMenu1.Check(mnu_Zoom150) = False
        PopupMenu1.Check(mnu_Zoom200) = False
        PopupMenu1.Check(mnu_Zoom300) = False
        PopupMenu1.Check(mnu_Zoom400) = False
        PopupMenu1.Check(mnu_Zoom500) = True
        PopupMenu1.Check(mnu_Zoom600) = False
        mfScale = 5
    Case mnu_Zoom600 ' 放大600%
        PopupMenu1.Check(mnu_Zoom100) = False
        PopupMenu1.Check(mnu_Zoom150) = False
        PopupMenu1.Check(mnu_Zoom200) = False
        PopupMenu1.Check(mnu_Zoom300) = False
        PopupMenu1.Check(mnu_Zoom400) = False
        PopupMenu1.Check(mnu_Zoom500) = False
        PopupMenu1.Check(mnu_Zoom600) = True
        mfScale = 6
    End Select
End Sub

















