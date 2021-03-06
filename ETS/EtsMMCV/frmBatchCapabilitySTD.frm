VERSION 5.00
Object = "{C115893A-A3BF-43AF-B28D-69DB846077F3}#1.0#0"; "vsflex8u.ocx"
Object = "{BEEECC20-4D5F-4F8B-BFDC-5D9B6FBDE09D}#1.0#0"; "vsflex8.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmBatchCapabilitySTD 
   Caption         =   "Batch Reporting"
   ClientHeight    =   5160
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10965
   Icon            =   "frmBatchCapabilitySTD.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   5160
   ScaleWidth      =   10965
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame frameReport 
      Caption         =   "File Name Format"
      Height          =   570
      Left            =   4680
      TabIndex        =   19
      Top             =   4560
      Width           =   4815
      Begin VB.CheckBox chkIncludeDate 
         Caption         =   "Include Date"
         Height          =   255
         Left            =   1800
         TabIndex        =   18
         Top             =   210
         Width           =   1455
      End
      Begin VB.CheckBox chkIncludeFilters 
         Caption         =   "Include Filters"
         Height          =   195
         Left            =   120
         TabIndex        =   21
         Top             =   240
         Width           =   1335
      End
      Begin VB.CheckBox chkIncludeTime 
         Caption         =   "Include Time"
         Height          =   195
         Left            =   3480
         TabIndex        =   20
         Top             =   240
         Width           =   1215
      End
   End
   Begin VSFlex8UCtl.VSFlexGrid fgExecution 
      Height          =   795
      Left            =   840
      TabIndex        =   16
      Top             =   3780
      Width           =   3795
      _cx             =   6694
      _cy             =   1402
      Appearance      =   1
      BorderStyle     =   1
      Enabled         =   -1  'True
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      MousePointer    =   0
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      BackColorFixed  =   -2147483633
      ForeColorFixed  =   -2147483630
      BackColorSel    =   -2147483635
      ForeColorSel    =   -2147483634
      BackColorBkg    =   -2147483636
      BackColorAlternate=   -2147483643
      GridColor       =   -2147483633
      GridColorFixed  =   -2147483632
      TreeColor       =   -2147483632
      FloodColor      =   192
      SheetBorder     =   -2147483642
      FocusRect       =   1
      HighLight       =   1
      AllowSelection  =   -1  'True
      AllowBigSelection=   -1  'True
      AllowUserResizing=   0
      SelectionMode   =   2
      GridLines       =   1
      GridLinesFixed  =   2
      GridLineWidth   =   1
      Rows            =   2
      Cols            =   3
      FixedRows       =   1
      FixedCols       =   0
      RowHeightMin    =   0
      RowHeightMax    =   0
      ColWidthMin     =   0
      ColWidthMax     =   0
      ExtendLastCol   =   0   'False
      FormatString    =   ""
      ScrollTrack     =   0   'False
      ScrollBars      =   3
      ScrollTips      =   0   'False
      MergeCells      =   0
      MergeCompare    =   0
      AutoResize      =   -1  'True
      AutoSizeMode    =   0
      AutoSearch      =   0
      AutoSearchDelay =   2
      MultiTotals     =   -1  'True
      SubtotalPosition=   1
      OutlineBar      =   0
      OutlineCol      =   0
      Ellipsis        =   0
      ExplorerBar     =   0
      PicturesOver    =   0   'False
      FillStyle       =   0
      RightToLeft     =   0   'False
      PictureType     =   0
      TabBehavior     =   0
      OwnerDraw       =   0
      Editable        =   2
      ShowComboButton =   1
      WordWrap        =   0   'False
      TextStyle       =   0
      TextStyleFixed  =   0
      OleDragMode     =   0
      OleDropMode     =   0
      DataMode        =   0
      VirtualData     =   -1  'True
      DataMember      =   ""
      ComboSearch     =   3
      AutoSizeMouse   =   -1  'True
      FrozenRows      =   0
      FrozenCols      =   0
      AllowUserFreezing=   0
      BackColorFrozen =   0
      ForeColorFrozen =   0
      WallPaperAlignment=   9
      AccessibleName  =   ""
      AccessibleDescription=   ""
      AccessibleValue =   ""
      AccessibleRole  =   24
   End
   Begin VB.CheckBox chkFilter 
      Alignment       =   1  'Right Justify
      Caption         =   "Display Filters"
      Height          =   315
      Left            =   4800
      TabIndex        =   15
      Top             =   3780
      Width           =   1335
   End
   Begin VB.TextBox txtEmail 
      Height          =   285
      Left            =   6240
      TabIndex        =   14
      Top             =   4080
      Width           =   3255
   End
   Begin VB.CheckBox chkEmail 
      Alignment       =   1  'Right Justify
      Caption         =   "Email reports"
      Height          =   315
      Left            =   4800
      TabIndex        =   13
      Top             =   4080
      Width           =   1335
   End
   Begin VB.CommandButton btnEnableDisable 
      Caption         =   "Enable All"
      Height          =   315
      Left            =   9600
      TabIndex        =   12
      Top             =   480
      Width           =   1335
   End
   Begin EtsMMCv.ctlRiskView ctlView 
      Height          =   255
      Left            =   9600
      TabIndex        =   6
      Top             =   1320
      Visible         =   0   'False
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   450
   End
   Begin VB.CommandButton btnSave 
      Caption         =   "Save"
      Height          =   315
      Left            =   9600
      TabIndex        =   4
      Top             =   3420
      Width           =   1335
   End
   Begin MSComDlg.CommonDialog dlgCommon 
      Left            =   6000
      Top             =   2280
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton btnDelete 
      Caption         =   "Delete"
      Height          =   315
      Left            =   9600
      TabIndex        =   3
      Top             =   3000
      Width           =   1335
   End
   Begin VB.CommandButton btnAddNew 
      Caption         =   "Add"
      Height          =   315
      Left            =   9600
      TabIndex        =   2
      Top             =   2580
      Width           =   1335
   End
   Begin VB.Timer tmrCalc 
      Enabled         =   0   'False
      Interval        =   60000
      Left            =   5040
      Top             =   2400
   End
   Begin VB.CommandButton btnClose 
      Caption         =   "Close"
      Height          =   315
      Left            =   9600
      TabIndex        =   5
      Top             =   4080
      Width           =   1335
   End
   Begin VB.CommandButton btnStart 
      Caption         =   "Run Now"
      Height          =   315
      Left            =   9600
      TabIndex        =   1
      Top             =   60
      Width           =   1335
   End
   Begin MSComctlLib.ProgressBar pbProgress 
      Height          =   240
      Left            =   0
      TabIndex        =   7
      Top             =   4680
      Width           =   1935
      _ExtentX        =   3413
      _ExtentY        =   423
      _Version        =   393216
      Appearance      =   1
      Scrolling       =   1
   End
   Begin MSComctlLib.ProgressBar pbOverall 
      Height          =   240
      Left            =   10200
      TabIndex        =   10
      Top             =   4680
      Visible         =   0   'False
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   423
      _Version        =   393216
      Appearance      =   1
      Scrolling       =   1
   End
   Begin VSFlex8Ctl.VSFlexGrid fgShedule 
      Height          =   3735
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9495
      _cx             =   16748
      _cy             =   6588
      Appearance      =   1
      BorderStyle     =   1
      Enabled         =   -1  'True
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      MousePointer    =   0
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      BackColorFixed  =   -2147483633
      ForeColorFixed  =   -2147483630
      BackColorSel    =   -2147483635
      ForeColorSel    =   -2147483634
      BackColorBkg    =   -2147483636
      BackColorAlternate=   -2147483643
      GridColor       =   -2147483633
      GridColorFixed  =   -2147483632
      TreeColor       =   -2147483632
      FloodColor      =   192
      SheetBorder     =   -2147483642
      FocusRect       =   1
      HighLight       =   1
      AllowSelection  =   0   'False
      AllowBigSelection=   0   'False
      AllowUserResizing=   1
      SelectionMode   =   1
      GridLines       =   1
      GridLinesFixed  =   2
      GridLineWidth   =   1
      Rows            =   1
      Cols            =   7
      FixedRows       =   1
      FixedCols       =   0
      RowHeightMin    =   0
      RowHeightMax    =   0
      ColWidthMin     =   0
      ColWidthMax     =   0
      ExtendLastCol   =   0   'False
      FormatString    =   ""
      ScrollTrack     =   0   'False
      ScrollBars      =   3
      ScrollTips      =   0   'False
      MergeCells      =   0
      MergeCompare    =   0
      AutoResize      =   -1  'True
      AutoSizeMode    =   0
      AutoSearch      =   0
      AutoSearchDelay =   2
      MultiTotals     =   -1  'True
      SubtotalPosition=   1
      OutlineBar      =   0
      OutlineCol      =   0
      Ellipsis        =   0
      ExplorerBar     =   0
      PicturesOver    =   0   'False
      FillStyle       =   0
      RightToLeft     =   0   'False
      PictureType     =   0
      TabBehavior     =   0
      OwnerDraw       =   0
      Editable        =   2
      ShowComboButton =   1
      WordWrap        =   0   'False
      TextStyle       =   0
      TextStyleFixed  =   0
      OleDragMode     =   0
      OleDropMode     =   0
      DataMode        =   0
      VirtualData     =   -1  'True
      DataMember      =   ""
      ComboSearch     =   3
      AutoSizeMouse   =   -1  'True
      FrozenRows      =   0
      FrozenCols      =   0
      AllowUserFreezing=   0
      BackColorFrozen =   0
      ForeColorFrozen =   0
      WallPaperAlignment=   9
      AccessibleName  =   ""
      AccessibleDescription=   ""
      AccessibleValue =   ""
      AccessibleRole  =   24
      Begin VB.Timer tmrClearView 
         Enabled         =   0   'False
         Interval        =   10
         Left            =   3120
         Top             =   1920
      End
   End
   Begin VB.Label lblShedule 
      Caption         =   "Schedule"
      Height          =   195
      Left            =   0
      TabIndex        =   17
      Top             =   3840
      Width           =   705
   End
   Begin VB.Image imgOverallStop 
      Height          =   240
      Left            =   10680
      MouseIcon       =   "frmBatchCapabilitySTD.frx":0E42
      MousePointer    =   99  'Custom
      Picture         =   "frmBatchCapabilitySTD.frx":0F94
      ToolTipText     =   "Cancel"
      Top             =   4680
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Label lblOverall 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Overall:"
      Height          =   195
      Left            =   9720
      TabIndex        =   11
      Top             =   4680
      Visible         =   0   'False
      Width           =   540
   End
   Begin VB.Image imgStopDis 
      Enabled         =   0   'False
      Height          =   240
      Left            =   0
      Picture         =   "frmBatchCapabilitySTD.frx":10DE
      Top             =   4680
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image imgStop 
      Height          =   240
      Left            =   1980
      MouseIcon       =   "frmBatchCapabilitySTD.frx":1228
      MousePointer    =   99  'Custom
      Picture         =   "frmBatchCapabilitySTD.frx":137A
      ToolTipText     =   "Cancel"
      Top             =   4680
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Label lblStatus 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Height          =   195
      Left            =   -60
      TabIndex        =   9
      Top             =   4620
      Width           =   45
   End
   Begin VB.Label lblProcess 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Process status..."
      Height          =   195
      Left            =   2280
      TabIndex        =   8
      Top             =   4680
      Visible         =   0   'False
      Width           =   1170
   End
   Begin VB.Menu mnuCtxSchedule 
      Caption         =   "Schedule"
      Enabled         =   0   'False
      Visible         =   0   'False
      Begin VB.Menu mnuCtxScheduleAdd 
         Caption         =   "Add Schedule"
      End
      Begin VB.Menu mnuCtxScheduleDel 
         Caption         =   "Del Schedule"
      End
   End
End
Attribute VB_Name = "frmBatchCapabilitySTD"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private m_frmOwner As Form

Private m_bIsLoaded As Boolean
Private m_bIsOpened As Boolean
Private m_bInit As Boolean

Private m_bCalc As Boolean
Private m_bStopCalc As Boolean
Private m_bManualStart As Boolean

Private m_CurReport As clsBatchReport

Private m_bEnableAll As Boolean
Private m_nDisableReportsCount As Long

Private m_nFrmHeight As Long
Private m_nFrmWidth As Long

Private Const STR_DEFAULT As String = "DefaultRiskView"

Private Enum BatchReportingColumnEnum
    BRC_ID = 0
    BRC_USER
    BRC_STATUS
    BRC_LAYOUT
    BRC_GROUP
    BRC_TRADER
    BRC_STRATEGY
    BRC_TRADER_GROUP
    BRC_POSITIONS
    BRC_LAST_RUN
    BRC_FILE_NAME_HEADER
    BRC_REPORT_FORMAT
    BRC_RESULT_FILE
    
    BRC_COLUMN_COUNT
End Enum

Public Enum ViewUpdateStatus
    VUS_REPORT = 1
    VUS_SHEDULE = 2
    VUS_OTHER = 4
End Enum

Private m_Reports As Collection
Private m_Shedule As Collection

'---------------------------------------------------------'
Private Function AddSchedule() As clsBatchReportingShedule
On Error GoTo error_exception
'----------------------------'
    Set AddSchedule = Nothing
    
    Dim lID As Long
    Dim aNewSchedule As clsBatchReportingShedule
    Set aNewSchedule = New clsBatchReportingShedule
    
    '--- generate key ---'
    lID = gDBW.usp_BR_Shedule_Save(CDate("1899-12-30"), 0)
    
    On Error Resume Next
    '-------------------'
        If ((Not m_Shedule Is Nothing) And (Not aNewSchedule Is Nothing)) Then
            aNewSchedule.ID = lID
            m_Shedule.Add aNewSchedule, Trim(Str(lID))
        End If
    
    Set AddSchedule = aNewSchedule
    
    Exit Function
'--------------'
error_exception:
    If Not g_PerformanceLog Is Nothing Then _
        g_PerformanceLog.LogMmInfo enLogDebug, "Error while calling AddNewSchedule() - " & Err.Description, "BatchReporting"
End Function

'------------------------------------------'
Private Sub RemoveSchedule(ByVal ID As Long)
On Error GoTo error_exception
'----------------------------'

        If (m_Shedule Is Nothing) Then Exit Sub
        
        On Error Resume Next
        '-------------------'
            m_Shedule.Remove Trim(Str(ID))
        
        On Error GoTo error_exception
        '----------------------------'
            gDBW.usp_BR_Shedule_Del ID
        
    Exit Sub
'--------------'
error_exception:
    If Not g_PerformanceLog Is Nothing Then _
        g_PerformanceLog.LogMmInfo enLogDebug, "Error while calling RemoveSchedule(ID=" & Str(ID) & ")", "BatchReporting"
End Sub
'----------------------------------'

Public Sub Init()
    On Error Resume Next
    
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting Init Enter.", GetCaption
    End If
    '----------------------------------------------------------------------------------'
    
        If m_bIsLoaded Then Exit Sub
        m_bIsLoaded = True
    
        m_bCalc = False
        m_bInit = False
    
        m_bManualStart = False
    
        CopyShedule g_Params.BatchReportingShedules, m_Shedule
        CopyReports g_Params.BatchReports, m_Reports

        Load Me
        
    '----------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting Init Exit.", GetCaption
    End If
    
End Sub

Public Sub ShowData(Optional ByRef frmOwner As Form = Nothing)
    On Error Resume Next
    
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting ShowData Enter.", GetCaption
    End If
    '--------------------------------------------------------------------------------------'
    
        If m_bIsOpened Then Exit Sub
        m_bIsOpened = True
    
        Set m_frmOwner = Nothing
        Set m_frmOwner = frmOwner
        If Not m_frmOwner Is Nothing Then m_frmOwner.Enabled = False
        
        CopyShedule g_Params.BatchReportingShedules, m_Shedule
        CopyReports g_Params.BatchReports, m_Reports
        InitControls
        
        OnDataUpdated VUS_REPORT Or VUS_SHEDULE
        UpdateControl
        
        Me.Show
        
    '--------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting ShowData Exit.", GetCaption
    End If
    
End Sub

Private Sub AddNewReport()
    On Error Resume Next
    
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting AddNewReport Enter.", GetCaption
    End If
    '------------------------------------------------------------------------------------------'
    
        Dim aNewReport As clsBatchReport
        Set aNewReport = New clsBatchReport
    
        aNewReport.Init
        aNewReport.UserName = g_Params.UserName
        aNewReport.Status = SS_NEW
        aNewReport.UseDefaultLayout = True
        aNewReport.LayoutFile = STR_DEFAULT

        m_Reports.Add aNewReport

        Set aNewReport = Nothing
    
    '-----------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting AddNewReport Exit.", GetCaption
    End If
    
End Sub

Private Sub DeleteReport(ByRef aReport As clsBatchReport)
    On Error Resume Next
    
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting DeleteReport Enter.", GetCaption
    End If
    '------------------------------------------------------------------------------------------'
    
        If (Not aReport Is Nothing) Then
            aReport.Status = SS_DELETED
        End If
    
    '------------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting DeleteReport Exit.", GetCaption
    End If
    
End Sub

Private Sub InitControls()
    On Error Resume Next
    Dim sComboList As String
    Dim aStrategy As EtsGeneralLib.EtsStrategyAtom
    Dim aTrader As EtsGeneralLib.EtsTraderAtom, aUndGroup As EtsGeneralLib.EtsUndGroupAtom
    Dim aTraderGroup As EtsGeneralLib.EtsTraderGroupAtom
    Dim iCol As Long
    
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting InitControls Enter.", GetCaption
    End If
    '------------------------------------------------------------------------------------------'
    
        m_bInit = True
        
        fgShedule.Cols = BRC_COLUMN_COUNT
        
        fgShedule.TextMatrix(0, BRC_ID) = "#"
        fgShedule.TextMatrix(0, BRC_USER) = "User"
        fgShedule.TextMatrix(0, BRC_STATUS) = "Status"
        fgShedule.TextMatrix(0, BRC_LAYOUT) = "Layout"
        fgShedule.TextMatrix(0, BRC_GROUP) = "Group"
        fgShedule.TextMatrix(0, BRC_TRADER) = "Trader"
        fgShedule.TextMatrix(0, BRC_STRATEGY) = "Strategy"
        fgShedule.TextMatrix(0, BRC_TRADER_GROUP) = "Trader Group"
        fgShedule.TextMatrix(0, BRC_POSITIONS) = "Positions"
        fgShedule.TextMatrix(0, BRC_LAST_RUN) = "Last Run"
        fgShedule.TextMatrix(0, BRC_RESULT_FILE) = "Result File"
        fgShedule.TextMatrix(0, BRC_FILE_NAME_HEADER) = "File Name Header"
        fgShedule.TextMatrix(0, BRC_REPORT_FORMAT) = "Report Format"
        
        fgShedule.ColComboList(BRC_LAYOUT) = "#0;" & STR_DEFAULT & "|#1;Custom"
        fgShedule.ColComboList(BRC_RESULT_FILE) = "..."
        
        fgShedule.ColComboList(BRC_STATUS) = "#1;Active|#0;Disabled"
        fgShedule.ColComboList(BRC_POSITIONS) = "#1;Expanded|#0;Totals"
        fgShedule.ColComboList(BRC_REPORT_FORMAT) = "#" & Trim(Str(BRF_CSV)) & ";CSV|#" & Trim(Str(BRF_HTML)) & ";HTML"
        
        sComboList = ""
        For Each aUndGroup In g_UnderlyingGroup
            sComboList = sComboList & "|#" & Trim$(Str$(aUndGroup.ID)) & ";" & aUndGroup.Name
        Next
        fgShedule.ColComboList(BRC_GROUP) = AdjustComboList(sComboList)
        
        sComboList = ""
        For Each aTrader In g_Trader
            sComboList = sComboList & "|#" & Trim$(Str$(aTrader.ID)) & ";" & aTrader.Name
        Next
        fgShedule.ColComboList(BRC_TRADER) = AdjustComboList(sComboList)
        
        sComboList = "|#" & Trim$(Str$(NO_STRATEGY_ID)) & ";" & NO_STRATEGY_NAME
        For Each aStrategy In g_Strategy
            sComboList = sComboList & "|#" & Trim$(Str$(aStrategy.ID)) & ";" & aStrategy.Name
        Next
        fgShedule.ColComboList(BRC_STRATEGY) = AdjustComboList(sComboList)
        
        sComboList = ""
        For Each aTraderGroup In g_TraderGroup
            If aTraderGroup.ID <> 0 Then
                sComboList = sComboList & "|#" & Trim$(Str$(aTraderGroup.ID)) & ";" & aTraderGroup.Name
            End If
        Next
        fgShedule.ColComboList(BRC_TRADER_GROUP) = AdjustComboList(sComboList)
        
        For iCol = BRC_ID To COLUMN_COUNT - 1
            fgShedule.ColAlignment(iCol) = flexAlignLeftCenter
        Next
        
        fgShedule.ColDataType(BRC_LAST_RUN) = flexDTDate
        fgShedule.ColFormat(BRC_LAST_RUN) = "hh:mm:ss AMPM"
        fgShedule.ColHidden(BRC_USER) = True
                  
        If (m_Shedule.Count >= 0) Then
            fgExecution.Cols = m_Shedule.Count
            For iCol = 0 To m_Shedule.Count - 1
                fgExecution.TextMatrix(0, iCol) = "Execution " & Str(iCol + 1)
                fgExecution.ColAlignment(iCol) = flexAlignCenterCenter
                fgExecution.ColDataType(iCol) = flexDTDate
                fgExecution.ColFormat(iCol) = "hh:mm:ss AMPM"
            Next
        End If
        
        m_bInit = False
    
    '----------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting InitControls Exit.", GetCaption
    End If
End Sub

Private Function AdjustComboList(sComboList As String) As String
    On Error Resume Next
    
    If Len(sComboList) > 0 Then
        If InStr(1, sComboList, "|") = 1 Then
            sComboList = "#0;<All>|" & Mid$(sComboList, InStr(1, sComboList, "|") + 1)
        Else
            sComboList = "#0;<All>|" & sComboList
        End If
    Else
        sComboList = "#0;<None>"
    End If
        
    AdjustComboList = sComboList
End Function

'Private Sub RefreshData()
'    On Error Resume Next
'
'    If Not g_PerformanceLog Is Nothing Then
'        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting RefreshData Enter.", GetCaption
'    End If
'    '-----------------------------------------------------------------------------------------'
'
'        m_bInit = True
'
'        OnDataUpdated VUS_REPORT Or VUS_SHEDULE
'
'        UpdateControl
'
'        m_bInit = False
'
'    '----------------------------------------------------------------------------------------'
'    If Not g_PerformanceLog Is Nothing Then
'        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting RefreshData Exit.", GetCaption
'    End If
'
'End Sub

Private Sub btnAddNew_Click()
    On Error Resume Next
    
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting btnAddNew_Click Enter.", GetCaption
    End If
    '---------------------------------------------------------------------------------------------'
    
        If m_bInit Then Exit Sub
        
        AddNewReport
        OnDataUpdated VUS_REPORT
    
    '---------------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting btnAddNew_Click Exit.", GetCaption
    End If
    
End Sub

Private Sub btnClose_Click()
    On Error Resume Next
    
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting btnClose_Click Enter.", GetCaption
    End If
    '--------------------------------------------------------------------------------------------'
    
        m_bIsOpened = False
        
        If Not m_frmOwner Is Nothing Then
            m_frmOwner.Enabled = True
            m_frmOwner.SetFocus
        End If
        
        Set m_frmOwner = Nothing
        
        Set m_Reports = Nothing
        Set m_Shedule = Nothing
        
        Me.Hide
    '--------------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting btnClose_Click Exit.", GetCaption
    End If
End Sub

Private Sub btnDelete_Click()
    On Error Resume Next
    Dim nRow As Long
    Dim aReportTask As clsBatchReport
    
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting btnDelete_Click Enter.", GetCaption
    End If
    '---------------------------------------------------------------------------------------------'
    
        If m_bInit Then Exit Sub
        
        nRow = fgShedule.RowSel
        If nRow > 0 Then
            Set aReportTask = fgShedule.RowData(nRow)
            If (Not aReportTask Is Nothing) Then
                DeleteReport aReportTask
                OnDataUpdated VUS_REPORT
                Set aReportTask = Nothing
            End If
        End If
    
    '---------------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting btnDelete_Click Exit.", GetCaption
    End If
End Sub

Private Sub btnEnableDisable_Click()
    On Error Resume Next
    Dim aReport As clsBatchReport
    
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting btnEnableDisable_Click Enter.", GetCaption
    End If
    '----------------------------------------------------------------------------------------------------'

        m_nDisableReportsCount = 0
        
        For Each aReport In m_Reports
            aReport.IsActive = m_bEnableAll
            
            If (aReport.Status <> SS_NEW And aReport.Status <> SS_DELETED) Then aReport.Status = SS_UPDATED
            
            If Not aReport.IsActive Then m_nDisableReportsCount = m_nDisableReportsCount + 1
        Next
        
        m_bEnableAll = CBool(m_nDisableReportsCount > 0)
        
        OnDataUpdated VUS_REPORT
        UpdateControl
    
    '----------------------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting btnEnableDisable_Click Exit.", GetCaption
    End If
    
End Sub

Private Sub btnSave_Click()
    On Error Resume Next
    
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting btnSave_Click Enter.", GetCaption
    End If
    '-------------------------------------------------------------------------------------------'
    
        Screen.MousePointer = vbHourglass
        
        g_Params.BatchReports = m_Reports
        g_Params.BatchReportingShedules = m_Shedule
        g_Params.SaveBatchShedule
        g_Params.SaveBatchReports
        
        g_Params.LoadBatchShedule
        g_Params.LoadBatchReports
    
        CopyShedule g_Params.BatchReportingShedules, m_Shedule
        CopyReports g_Params.BatchReports, m_Reports
        
        OnDataUpdated VUS_REPORT Or VUS_SHEDULE
        
        Screen.MousePointer = vbDefault
    
    '-------------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting btnSave_Click Exit.", GetCaption
    End If
    
End Sub

Private Sub btnStart_Click()
    On Error Resume Next
    Dim nRow As Long
    Dim aReportTask As clsBatchReport
    
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting btnStart_Click Enter.", GetCaption
    End If
    '--------------------------------------------------------------------------------------------'
    
        nRow = fgShedule.RowSel
        
        If nRow > 0 And Not m_bCalc Then
            m_bManualStart = True
            
            Set aReportTask = fgShedule.RowData(nRow)
            If (Not aReportTask Is Nothing) Then
                CalcReport aReportTask
                Set aReportTask = Nothing
            End If
        End If
    
    '-------------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting btnStart_Click Exit.", GetCaption
    End If
    
End Sub

Private Sub chkIncludeDate_Click()
    g_Params.BR_IncludeDate = (chkIncludeDate.Value <> 0)
End Sub

Private Sub chkIncludeFilters_Click()
On Error Resume Next
    g_Params.BR_IncludeFilters = (chkIncludeFilters.Value <> 0)
End Sub

Private Sub chkIncludeTime_Click()
    g_Params.BR_IncludeTime = (chkIncludeTime.Value <> 0)
End Sub

Private Sub chkEmail_Click()
    On Error Resume Next
    g_Params.BR_SendEmail = chkEmail.Value
    txtEmail.Enabled = g_Params.BR_SendEmail
End Sub

Private Sub chkFilter_Click()
    On Error Resume Next
    g_Params.BR_FilterDisplay = chkFilter.Value
End Sub

Private Sub ctlView_OnRefreshCancel()
    On Error Resume Next
    
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting RV_OnRefreshCancel Enter. " & GetCurInfo, GetCaption
    End If
    '--------------------------------------------------------------------------------------------------------------'
        
        tmrClearView.Enabled = True
        
        Set m_CurReport = Nothing
        m_bManualStart = False
            
    '--------------------------------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting RV_OnRefreshCancel Exit.", GetCaption
    End If
    
End Sub

Private Sub ctlView_OnRefreshComplete()
    On Error Resume Next
    
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting RV_OnRefreshComplete Enter. " & GetCurInfo, GetCaption
    End If
    '----------------------------------------------------------------------------------------------------------------'
            
        SaveResults
    
    '----------------------------------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting RV_OnRefreshComplete Exit.", GetCaption
    End If
    
End Sub

Private Sub ctlView_OnRefreshEmpty()
    On Error Resume Next
    
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting RV_OnRefreshEmpty Enter. " & GetCurInfo, GetCaption
    End If
    '-------------------------------------------------------------------------------------------------------------'

        SaveResults
    
    '-------------------------------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting RV_OnRefreshEmpty Exit.", GetCaption
    End If
End Sub

Private Sub ctlView_OnRefreshError()
    On Error Resume Next
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting RV_OnRefreshError Enter. " & GetCurInfo, GetCaption
    End If
    '-------------------------------------------------------------------------------------------------------------'
    
        SaveResults
        
    '-------------------------------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting RV_OnRefreshError Exit.", GetCaption
    End If
End Sub

Private Sub fgExecution_AfterEdit(ByVal Row As Long, ByVal Col As Long)
    On Error Resume Next
'-------------------'
    Dim dtValue As Date
    Dim aShedule As clsBatchReportingShedule
    Dim sKey As String
    '---------------------------------------'
    If Not g_PerformanceLog Is Nothing Then _
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting fgExecution_AfterEdit Enter. Row/Col = " & CStr(Row) & "/" & CStr(Col), GetCaption
    '--------------------------------------------------------------------------------------------------------------------------------------------'
    
    If (Col >= 0) Then
        ' -- ColData contain id of schedule in DB ---'
        sKey = Trim(Str(fgExecution.ColData(Col)))
        
        '--- select current schedule ---'
        Set aShedule = m_Shedule(sKey)
    
        '-------------------'
        Err.Clear
        dtValue = CDate(fgExecution.TextMatrix(Row, Col))
        '--- setup value ---'
        If (Not aShedule Is Nothing) Then
            If (Err.Number = 0) Then
                aShedule.ExecTime = dtValue
                aShedule.Enabled = True
                aShedule.LastRun = CDate(0)
            Else
                aShedule.ExecTime = CDate(0)
                aShedule.Enabled = False
                aShedule.LastRun = CDate(0)
            End If
        End If
        
        '--- Refresh Schedule Grid ---'
        OnDataUpdated VUS_SHEDULE
        
        Set aShedule = Nothing
    End If
    
    '----------------------------------------'
    If Not g_PerformanceLog Is Nothing Then _
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting fgExecution_AfterEdit Exit.", GetCaption
    '---------------------------------------------------------------------------------------------------'
End Sub

Private Sub fgExecution_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error GoTo error_exception
'----------------------------'
    
    If (Button = vbRightButton) Then
        Me.PopupMenu mnuCtxSchedule, , X, Y + fgExecution.Top
    End If
    
    Exit Sub
'---------------'
error_exception:
    If Not g_PerformanceLog Is Nothing Then _
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting fgExecution_MouseUp Exit.", GetCaption
End Sub

Private Sub fgShedule_AfterEdit(ByVal Row As Long, ByVal Col As Long)
    On Error Resume Next
    Dim dtValue As Date
    Dim aReportTask As clsBatchReport
    Dim sFileName As String
    
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting fgShedule_AfterEdit Enter. Row/Col = " & CStr(Row) & "/" & CStr(Col), GetCaption
    End If
    '--------------------------------------------------------------------------------------------------------------------------------------------'
    
        If m_bInit Then Exit Sub
        
        Set aReportTask = fgShedule.RowData(Row)
        If (Not aReportTask Is Nothing) Then
            Select Case Col
                Case BRC_STATUS
                    aReportTask.IsActive = CBool(fgShedule.TextMatrix(Row, Col))
                    If aReportTask.Status = SS_COMMON Then aReportTask.Status = SS_UPDATED
                    
                    m_nDisableReportsCount = m_nDisableReportsCount + IIf(aReportTask.IsActive, -1, 1)
                    m_bEnableAll = CBool(m_bDisableReportsCount > 0)
                    btnEnableDisable.Caption = IIf(m_bEnableAll, "Enable All", "Disable All")
                    
                Case BRC_GROUP
                    aReportTask.GroupID = CLng(fgShedule.TextMatrix(Row, Col))
                    If aReportTask.Status = SS_COMMON Then aReportTask.Status = SS_UPDATED
                    SetUpFilters Col, aReportTask.GroupID, aReportTask
                    
                Case BRC_TRADER
                    aReportTask.TraderID = CLng(fgShedule.TextMatrix(Row, Col))
                    If aReportTask.Status = SS_COMMON Then aReportTask.Status = SS_UPDATED
                    SetUpFilters Col, aReportTask.TraderID, aReportTask
                    
                Case BRC_STRATEGY
                    aReportTask.StrategyID = CLng(fgShedule.TextMatrix(Row, Col))
                    If aReportTask.Status = SS_COMMON Then aReportTask.Status = SS_UPDATED
                    SetUpFilters Col, aReportTask.StrategyID, aReportTask
                    
                Case BRC_TRADER_GROUP
                    aReportTask.TraderGroupID = CLng(fgShedule.TextMatrix(Row, Col))
                    If aReportTask.Status = SS_COMMON Then aReportTask.Status = SS_UPDATED
                    SetUpFilters Col, aReportTask.TraderGroupID, aReportTask
                    
                Case BRC_POSITIONS
                    aReportTask.IsPosExpanded = CBool(fgShedule.TextMatrix(Row, Col))
                    If aReportTask.Status = SS_COMMON Then aReportTask.Status = SS_UPDATED
                    
                Case BRC_FILE_NAME_HEADER
                    aReportTask.FileNameHeader = fgShedule.TextMatrix(Row, Col)
                    If aReportTask.Status = SS_COMMON Then aReportTask.Status = SS_UPDATED
                    
                Case BRC_REPORT_FORMAT
                    aReportTask.ReportFormat = CLng(fgShedule.TextMatrix(Row, Col))
                    If aReportTask.Status = SS_COMMON Then aReportTask.Status = SS_UPDATED
                    
                Case Else
            End Select
        End If
    
    '--------------------------------------------------------------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting fgShedule_AfterEdit Exit.", GetCaption
    End If
End Sub

Private Sub fgShedule_BeforeEdit(ByVal Row As Long, ByVal Col As Long, Cancel As Boolean)
    On Error Resume Next
    If m_bInit Then Exit Sub
    
    If (Col = BRC_ID Or Col = BRC_USER Or Col = BRC_LAST_RUN) Then
        Cancel = True
        Exit Sub
    End If
    
End Sub

Private Sub fgShedule_CellButtonClick(ByVal Row As Long, ByVal Col As Long)
    On Error Resume Next
    Dim sFilePath As String
    Dim sFileName As String
    Dim aReportTask As clsBatchReport
    
    If m_bInit Then Exit Sub

    Set aReportTask = fgShedule.RowData(Row)
    
    If (Not aReportTask Is Nothing) Then
        Select Case Col
            Case BRC_RESULT_FILE
                sFilePath = aReportTask.ResultFilePath
                If BrowseForFolder(Me, "Select folder for result file", sFilePath) And Len(sFilePath) > 0 Then
                    aReportTask.ResultFilePath = sFilePath + "\"
                    If aReportTask.Status = SS_COMMON Then aReportTask.Status = SS_UPDATED
                End If
            Case Else
        End Select
    End If
End Sub

Private Sub OnDataUpdated(ByVal Status As ViewUpdateStatus)
    On Error GoTo error_exception
        
        If ((Status And VUS_REPORT) = VUS_REPORT) Then
            UpdateTaskView
        End If
        
        If ((Status And VUS_SHEDULE) = VUS_SHEDULE) Then
            UpdateSheduleView
        End If
        
    Exit Sub
    
error_exception:
    Debug.Print "Exception in: frmBatchCapability::OnDataUpdated()"
End Sub

Private Sub UpdateControl()
    On Error GoTo error_exception
    
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting UpdateControl() Enter.", GetCaption
    End If
    '---------------------------------------------------------------------------------------------'
    
        btnEnableDisable.Caption = IIf(m_bEnableAll, "Enable All", "Disable All")
        txtEmail.Enabled = g_Params.BR_SendEmail
        chkFilter.Value = IIf(g_Params.BR_FilterDisplay, 1, 0)
        chkEmail.Value = IIf(g_Params.BR_SendEmail, 1, 0)
        txtEmail.Text = g_Params.BR_Email
        
        chkIncludeTime.Value = IIf(g_Params.BR_IncludeTime, 1, 0)
        chkIncludeDate.Value = IIf(g_Params.BR_IncludeDate, 1, 0)
        chkIncludeFilters.Value = IIf(g_Params.BR_IncludeFilters, 1, 0)
    
    '---------------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting UpdateControl() Exit.", GetCaption
    End If
    
    Exit Sub
    
error_exception:
    '--------------------------------------------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting UpdateControl() Exit with error: " & Err.Description, GetCaption
    End If
End Sub

Private Function GetActualTasksCount(ByRef Tasks As Collection) As Long
    On Error GoTo error_exception
    Dim aReport As clsBatchReport
    Dim lReportCount As Long
    
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting GetActualTasksCount() Enter.", GetCaption
    End If
    '---------------------------------------------------------------------------------------------'
    
        lReportCount = 0
        If (Not Tasks Is Nothing) Then
            For Each aReport In Tasks
                If (aReport.Status <> SS_DELETED) Then
                    lReportCount = lReportCount + 1
                End If
            Next
        End If
        GetActualTasksCount = lReportCount
    
    '---------------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting GetActualTasksCount() Exit.", GetCaption
    End If
    
    Exit Function
    
error_exception:
    Debug.Print "Exception in: GetAllActualTasks()"
    '---------------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting GetActualTasksCount() Exit with error: " & Err.Description, GetCaption
    End If
End Function

Private Function GetRiskViewFilter(ByRef Report As clsBatchReport) As FilterTypeEnum
    On Error GoTo error_exception

    If (Not Report Is Nothing) Then
        GetRiskViewFilter = TYPE_ALL
        If (Report.GroupID <> 0) Then
            GetRiskViewFilter = TYPE_GROUP
        ElseIf (Report.TraderGroupID <> 0) Then
            GetRiskViewFilter = TYPE_TRADER_GROUP
        ElseIf (Report.StrategyID <> 0) Then
            GetRiskViewFilter = TYPE_STRATEGY
        ElseIf (Report.TraderID <> 0) Then
            GetRiskViewFilter = TYPE_TRADER
        End If
    End If
    
    Exit Function
error_exception:
    Debug.Print "Exception in: frmBatchCapabilitySTD::GetRiskViewFilter()"
End Function

Private Function GetValueByFilter(ByVal Filter As FilterTypeEnum, ByRef Report As clsBatchReport) As Long
    On Error GoTo error_exception
        
        GetValueByFilter = -1
        If (Not Report Is Nothing) Then
            If (Filter = TYPE_GROUP) Then
                GetValueByFilter = Report.GroupID
            ElseIf (Filter = TYPE_STRATEGY) Then
                GetValueByFilter = Report.StrategyID
            ElseIf (Filter = TYPE_TRADER) Then
                GetValueByFilter = Report.TraderID
            ElseIf (Filter = TYPE_TRADER_GROUP) Then
                GetValueByFilter = Report.TraderGroupID
            ElseIf (Filter = TYPE_ALL) Then
                GetValueByFilter = -1
            End If
        End If
        
    Exit Function
error_exception:
    Debug.Print "Exception in: GetValueByFilter()"
End Function

Private Sub SetUpFilters(ByVal Filter As BatchReportingColumnEnum, ByVal NewValue As Long, ByRef Report As clsBatchReport)
    On Error GoTo error_exception
        
        If (Report Is Nothing) Then Exit Sub
        If (Filter = BRC_GROUP Or _
            Filter = BRC_STRATEGY Or _
            Filter = BRC_TRADER Or _
            Filter = BRC_TRADER_GROUP) Then
            '-------------------------------'
            
            Report.GroupID = 0
            Report.TraderID = 0
            Report.StrategyID = 0
            Report.TraderGroupID = 0
            
            If (Filter = BRC_GROUP) Then
                Report.GroupID = NewValue
            ElseIf (Filter = BRC_STRATEGY) Then
                Report.StrategyID = NewValue
            ElseIf (Filter = BRC_TRADER) Then
                Report.TraderID = NewValue
            ElseIf (Filter = BRC_TRADER_GROUP) Then
                Report.TraderGroupID = NewValue
            End If
            
            Report.Status = SS_UPDATED
            
            OnDataUpdated VUS_REPORT
        End If
    Exit Sub
    
error_exception:
    Debug.Print "Exception in: frmBatchCapabilitySTD::UpdateFilters()"
End Sub

Public Sub UpdateTaskView()
    On Error GoTo error_exception

    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting UpdateTaskView() Enter.", GetCaption
    End If
    '----------------------------------------------------------------------------------------------'
    
    Dim aReport As clsBatchReport
    Dim nRow As Long
    
    fgShedule.Redraw = flexRDNone
    
    fgShedule.Rows = GetActualTasksCount(m_Reports) + 1
    nRow = 0
    
    For Each aReport In m_Reports
        If (Not aReport Is Nothing) Then
            If (aReport.Status <> SS_DELETED) Then
                With fgShedule
                    nRow = nRow + 1
                    .TextMatrix(nRow, BRC_ID) = nRow
                    .TextMatrix(nRow, BRC_USER) = aReport.UserName
                    .TextMatrix(nRow, BRC_STATUS) = IIf(aReport.IsActive, 1, 0)
                    .TextMatrix(nRow, BRC_LAYOUT) = IIf(aReport.UseDefaultLayout, STR_DEFAULT, aReport.LayoutFile)
                    .TextMatrix(nRow, BRC_GROUP) = aReport.GroupID
                    .TextMatrix(nRow, BRC_TRADER) = aReport.TraderID
                    .TextMatrix(nRow, BRC_STRATEGY) = aReport.StrategyID
                    .TextMatrix(nRow, BRC_TRADER_GROUP) = aReport.TraderGroupID
                    .TextMatrix(nRow, BRC_POSITIONS) = IIf(aReport.IsPosExpanded, 1, 0)
                    .TextMatrix(nRow, BRC_LAST_RUN) = IIf(aReport.LastRun > 0, aReport.LastRun, "")
                    .TextMatrix(nRow, BRC_RESULT_FILE) = aReport.ResultFile
                    .TextMatrix(nRow, BRC_FILE_NAME_HEADER) = aReport.FileNameHeader
                    .TextMatrix(nRow, BRC_REPORT_FORMAT) = aReport.ReportFormat
                    .RowData(nRow) = aReport
                End With
            End If
            Set aReport = Nothing
        End If
        
    Next

    fgShedule.AutoSize 0, fgShedule.Cols - 1, , 100
    fgShedule.Redraw = flexRDBuffered
    
    '----------------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting UpdateTaskView() Exit.", GetCaption
    End If
    
    Exit Sub
error_exception:
    Debug.Print "Exception in: UpdateTaskView()"
    fgShedule.Redraw = flexRDBuffered
End Sub

Public Sub UpdateSheduleView()
    On Error GoTo error_exception
    '----------------------------'
        If Not g_PerformanceLog Is Nothing Then
            g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting UpdateSheduleView() Enter.", GetCaption
        End If
        '-------------------------------------------------------------------------------------------------'
        
        Dim aShedule As clsBatchReportingShedule
        Dim iCol As Long
        
        If (Not m_Shedule Is Nothing) Then
            If (m_Shedule.Count >= 0) Then
                iCol = 0: fgExecution.Cols = m_Shedule.Count
                For Each aShedule In m_Shedule
                    fgExecution.TextMatrix(0, iCol) = "Execution " & Str(iCol + 1)
                    fgExecution.ColAlignment(iCol) = flexAlignCenterCenter
                    fgExecution.ColDataType(iCol) = flexDTDate
                    fgExecution.ColFormat(iCol) = "hh:mm:ss AMPM"
                    fgExecution.TextMatrix(1, iCol) = IIf(aShedule.Enabled, aShedule.ExecTime, "<none>")
                    fgExecution.ColData(iCol) = aShedule.ID
                    iCol = iCol + 1
                Next
                
                If (fgExecution.Cols > 0) Then
                    fgExecution.AutoSize 0, fgExecution.Cols - 1, , 100
                End If
                
            End If
        End If
        
        '-------------------------------------------------------------------------------------------------'
        If Not g_PerformanceLog Is Nothing Then
            g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting UpdateSheduleView() Exit.", GetCaption
        End If
    Exit Sub
    '-----------------------------'
error_exception:
    Debug.Print "Exception in: UpdateSheduleView()"
End Sub

Private Function LayoutFileDialog() As String
    On Error Resume Next
    
    LayoutFileDialog = STR_NA
    
    dlgCommon.Flags = cdlOFNExplorer Or cdlOFNLongNames Or cdlOFNPathMustExist _
                                     Or cdlOFNHideReadOnly Or cdlOFNFileMustExist
    
    dlgCommon.CancelError = True
    dlgCommon.DefaultExt = ".txt"
    dlgCommon.DialogTitle = "Load layout file"
    dlgCommon.FileName = ""
    dlgCommon.InitDir = g_Params.CurrentUserPrivateFolder
    dlgCommon.Filter = "Risk View layout file (*.rvw)|*.rvw;|All Files|*.*"
    dlgCommon.FilterIndex = 1
    
    dlgCommon.ShowOpen
    If Err.Number = 0 Then
        LayoutFileDialog = dlgCommon.FileName
    End If
    
End Function

Private Sub fgShedule_ComboCloseUp(ByVal Row As Long, ByVal Col As Long, FinishEdit As Boolean)
    On Error Resume Next
    Dim dtValue As Date
    Dim aReportTask As clsBatchReport
    Dim sFileName As String
    
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting fgShedule_ComboCloseUp Enter. Row/Col = " & CStr(Row) & "/" & CStr(Col), GetCaption
    End If
    '---------------------------------------------------------------------------------------------------------------------------------------------'
    
        If m_bInit Then Exit Sub
        
        Set aReportTask = fgShedule.RowData(Row)
        If (Not aReportTask Is Nothing) Then
            Select Case Col
                Case BRC_LAYOUT
                    If (fgShedule.ComboIndex <> 0) Then
    
                        aReportTask.UseDefaultLayout = False
    
                        sFileName = LayoutFileDialog
                        If sFileName <> STR_NA Then
                            aReportTask.LayoutFile = ExtractFileName(sFileName)
                            aReportTask.LayoutFilePath = ExtractFilePath(sFileName)
                            fgShedule.TextMatrix(Row, Col) = aReportTask.LayoutFile
                        Else
                            fgShedule.TextMatrix(Row, Col) = STR_DEFAULT
                            aReportTask.UseDefaultLayout = True
                            aReportTask.LayoutFile = STR_DEFAULT
                            aReportTask.LayoutFilePath = ""
                        End If
                    Else
                        aReportTask.UseDefaultLayout = True
                        aReportTask.LayoutFile = STR_DEFAULT
                        aReportTask.LayoutFilePath = ""
                    End If
                    FinishEdit = True
                    If aReportTask.Status <> SS_DELETED Then aReportTask.Status = SS_UPDATED
                Case Else
            End Select
        End If
    
    '---------------------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting fgShedule_ComboCloseUp Exit.", GetCaption
    End If
    
End Sub

Private Sub Form_Load()
    On Error Resume Next
    
    InitRisksView
    
    m_nFrmHeight = Me.Height
    m_nFrmWidth = Me.Width
        
    tmrCalc.Enabled = g_Params.ExecuteBatchReporting
    tmrClearView.Enabled = False
End Sub

Private Sub Form_Resize()
    On Error Resume Next
    Dim dScaleY As Double
    Dim dScaleX As Double
    
    dScaleY = Me.Height / m_nFrmHeight
    dScaleX = Me.Width / m_nFrmWidth
    If ((dScaleY > 100) Or (dScaleY < 0.05)) Then dScaleY = 1
    If ((dScaleX > 100) Or (dScaleX < 0.05)) Then dScaleX = 1
    
    fgShedule.Move fgShedule.Left, fgShedule.Top, fgShedule.Width * dScaleX, fgShedule.Height * dScaleY
    
    btnAddNew.Move btnAddNew.Left * dScaleX, btnAddNew.Top * dScaleY, btnAddNew.Width * dScaleX, btnAddNew.Height * dScaleY
    btnStart.Move btnStart.Left * dScaleX, btnStart.Top * dScaleY, btnStart.Width * dScaleX, btnStart.Height * dScaleY
    btnClose.Move btnClose.Left * dScaleX, btnClose.Top * dScaleY, btnClose.Width * dScaleX, btnClose.Height * dScaleY
    btnSave.Move btnSave.Left * dScaleX, btnSave.Top * dScaleY, btnSave.Width * dScaleX, btnSave.Height * dScaleY
    btnDelete.Move btnDelete.Left * dScaleX, btnDelete.Top * dScaleY, btnDelete.Width * dScaleX, btnDelete.Height * dScaleY
    btnEnableDisable.Move btnEnableDisable.Left * dScaleX, btnEnableDisable.Top * dScaleY, btnEnableDisable.Width * dScaleX, btnDelete.Height * dScaleY
    
    pbProgress.Move pbProgress.Left * dScaleX, pbProgress.Top * dScaleY ', pbProgress.Width * dScaleX ', pbProgress.Height * dScaleY
    lblProcess.Move lblProcess.Left * dScaleX, lblProcess.Top * dScaleY ', lblProcess.Width * dScaleX , pbProgress.Height * dScaleY
    lblStatus.Move lblStatus.Left * dScaleX, lblStatus.Top * dScaleY ', lblStatus.Width * dScaleX  ', pbProgress.Height * dScaleY
    imgStop.Move imgStop.Left * dScaleX, imgStop.Top * dScaleY ', lblStatus.Width * dScaleX  , pbProgress.Height * dScaleY
    imgStopDis.Move imgStopDis.Left * dScaleX, imgStopDis.Top * dScaleY ', imgStopDis.Width * dScaleX  , pbProgress.Height * dScaleY
    
    lblShedule.Move lblShedule.Left, lblShedule.Top * dScaleY  ', lblShedule.Width * dScaleX, lblShedule.Height * dScale
    fgExecution.Move fgExecution.Left, fgExecution.Top * dScaleY ', fgExecution.Width * dScaleX, fgExecution.Height * dScaleY
    chkFilter.Move chkFilter.Left, chkFilter.Top * dScaleY  ', chkFilter.Width * dScaleX, chkFilter.Height * dScaleY
    chkEmail.Move chkEmail.Left, chkEmail.Top * dScaleY  ', chkEmail.Width * dScaleX , chkEmail.Height * dScaleY
    txtEmail.Move txtEmail.Left, txtEmail.Top * dScaleY  ', txtEmail.Width * dScaleX ', txtEmail.Height * dScaleY
    
    frameReport.Move frameReport.Left, frameReport.Top * dScaleY
    
    m_nFrmHeight = Me.Height
    m_nFrmWidth = Me.Width
End Sub

Public Sub Term()
    On Error Resume Next
    Set m_Shedule = Nothing
    ClearRisksView
End Sub

Private Sub Form_Unload(Cancel As Integer)
    On Error Resume Next
    Cancel = True
    m_bIsOpened = False
    
    If Not m_frmOwner Is Nothing Then
        m_frmOwner.Enabled = True
        m_frmOwner.SetFocus
    End If
    
'    Set m_frmOwner = Nothing
'    Set m_Reports = Nothing
'    Set m_Shedule = Nothing
    
    Me.Hide
End Sub

Private Sub imgOverallStop_Click()
    On Error Resume Next
    If Not g_PerformanceLog Is Nothing Then _
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting imgOverallStop_Click.", GetCaption
    
    tmrClearView.Enabled = True
    
    Set m_CurReport = Nothing
    
    m_bManualStart = False
    
End Sub

Private Sub mnuCtxScheduleAdd_Click()
On Error GoTo error_exception
'----------------------------'
    
    Dim aSchedule As clsBatchReportingShedule
    Set aSchedule = AddSchedule
    
    If (Not aSchedule Is Nothing) Then
        
        '--- Refresh Schedule Grid ---'
        OnDataUpdated VUS_SHEDULE
        
    End If
    
Exit Sub
'--------------'
error_exception:
    If Not g_PerformanceLog Is Nothing Then _
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting mnuCtxScheduleAdd_Click() Exit with Error: " & Err.Description, "BatchReporting"
End Sub

Private Sub mnuCtxScheduleDel_Click()
On Error GoTo error_exception
'----------------------------'
    Dim lRmvID As Long
    
    If (Not fgExecution Is Nothing) Then
        If (fgExecution.Col >= 0) Then
        
            lRmvID = fgExecution.ColData(fgExecution.Col)
            
            '--- Remove Schedule ---'
            RemoveSchedule lRmvID
            
            '--- Refresh Schedule Grid ---'
            OnDataUpdated VUS_SHEDULE
            
        End If
    End If
Exit Sub
'---------------'
error_exception:
    If Not g_PerformanceLog Is Nothing Then _
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting mnuCtxScheduleDel_Click() Exit with Error: " & Err.Description, "BatchReporting"
End Sub

Private Sub tmrCalc_Timer()
    On Error Resume Next
    Dim dtNow As Date
    Dim aShedule As clsBatchReportingShedule
    Dim aReport As clsBatchReport

    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting tmrCalc_Timer Enter.", GetCaption
    End If
    '-------------------------------------------------------------------------------------------'

        dtNow = Now
        For Each aShedule In m_Shedule
            If aShedule.IsReady(dtNow) Then

                If m_bCalc Then
                    If Not g_PerformanceLog Is Nothing Then
                        g_PerformanceLog.LogMmInfo enLogDebug, "BatchCapability tmrCalc_Timer. Some report already executed.", GetCaption
                    End If
                    Exit Sub
                End If

                gDBW.usp_BR_Shedule_Complete aShedule.ID, dtNow
                aShedule.LastRun = dtNow

                m_bManualStart = False

                For Each aReport In m_Reports
                    If aReport.IsActive Then
                        CalcReport aReport
                    End If
                Next
            End If
        Next
        
    '-------------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting tmrCalc_Timer Exit.", GetCaption
    End If
End Sub

Private Sub CalcReport(ByRef aReport As clsBatchReport)
    On Error GoTo error_exception
    
    Dim aFilters As EtsGeneralLib.EtsFilterData
    Dim aStorage As clsSettingsStorage

    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting CalcReport Enter. " & GetCurInfo, GetCaption
    End If
    '------------------------------------------------------------------------------------------------------'

        While m_bCalc
            MMSleep 100
        Wend
    
        If m_bStopCalc Then
            m_bStopCalc = False
            If Not g_PerformanceLog Is Nothing Then
                g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting CalcReport Stop Calc.", GetCaption
            End If
            Exit Sub
        End If
    
        m_bCalc = True
    
        'InitRisksView
        Set aStorage = New clsSettingsStorage
        
        If (Not aReport.UseDefaultLayout) Then
            aStorage.Init aReport.LayoutFilePath + aReport.LayoutFile
            aStorage.ReadData
            If aStorage.GetStringValue("Type", "Value") = "RisksView" Then
                m_bIsRM = False
                ctlView.OpenFromFile aStorage, "", False
            Else
                m_bCalc = False
                LogEvent EVENT_ERROR, "Can't start report calculation, invalid file " & aReport.LayoutFilePath + aReport.LayoutFile
                Exit Sub
            End If
        End If
    
        '------------------------------------------------------------------------------------------------------'
        If Not g_PerformanceLog Is Nothing Then
            g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting CalcReport. " & GetCurInfo, GetCaption
        End If
        '------------------------------------------------------------------------------------------------------'
    
        Set m_CurReport = aReport
        
        Dim RVFilter As FilterTypeEnum
        Dim value_ID As Long
        
        RVFilter = GetRiskViewFilter(aReport)
        value_ID = GetValueByFilter(RVFilter, aReport)
        
        ctlView.ShowData RVFilter, value_ID
        
        If (aReport.Status <> SS_NEW And _
            aReport.Status <> SS_DELETED) Then
            '---------------------------'
            aReport.Status = SS_UPDATED
        End If
        
        '------------------------------------------------------------------------------------------------------'
        If Not g_PerformanceLog Is Nothing Then
            g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting CalcReport Exit.", GetCaption
        End If
            
    Exit Sub

error_exception:
    '------------------------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting CalcReport Exit With Error " & Err.Description, GetCaption
    End If
    
    Debug.Print "Error in CalcReport()"
End Sub

Public Function GetCaption() As String
    On Error Resume Next
    GetCaption = Me.Caption
End Function

Private Sub CopyShedule(ByRef aSrc As Collection, ByRef aDst As Collection)
    On Error Resume Next
    Dim aSrcItem As clsBatchReportingShedule
    Dim aDstItem As clsBatchReportingShedule

    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting CopyShedule Enter.", GetCaption
    End If
    '-----------------------------------------------------------------------------------------'

        Set aDst = Nothing
        Set aDst = New Collection
    
        For Each aSrcItem In aSrc
            Set aDstItem = New clsBatchReportingShedule
            
            aDstItem.ID = aSrcItem.ID
            aDstItem.ExecTime = aSrcItem.ExecTime
            aDstItem.Enabled = aSrcItem.Enabled
            aDstItem.LastRun = aSrcItem.LastRun
            
            aDst.Add aDstItem, Trim(Str(aSrcItem.ID))
        
            Set aDstItem = Nothing
        Next
    
    '-----------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting CopyShedule Exit.", GetCaption
    End If
End Sub

Private Sub CopyReports(ByRef aSrc As Collection, ByRef aDst As Collection)
    On Error Resume Next
    Dim aSrcItem As clsBatchReport
    Dim aDstItem As clsBatchReport

    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting CopyReports Enter.", GetCaption
    End If
    '-----------------------------------------------------------------------------------------'
        
        m_nDisableReportsCount = 0
    
        Set aDst = Nothing
        Set aDst = New Collection
    
        For Each aSrcItem In aSrc
            Set aDstItem = New clsBatchReport
            
            aDstItem.ID = aSrcItem.ID
            aDstItem.UserName = aSrcItem.UserName
            aDstItem.IsActive = aSrcItem.IsActive
            aDstItem.LayoutFile = aSrcItem.LayoutFile
            aDstItem.LayoutFilePath = aSrcItem.LayoutFilePath
            aDstItem.GroupID = aSrcItem.GroupID
            aDstItem.TraderID = aSrcItem.TraderID
            aDstItem.StrategyID = aSrcItem.StrategyID
            aDstItem.TraderGroupID = aSrcItem.TraderGroupID
            aDstItem.IsPosExpanded = aSrcItem.IsPosExpanded
            aDstItem.LastRun = aSrcItem.LastRun
            aDstItem.ResultFile = aSrcItem.ResultFile
            aDstItem.ResultFilePath = aSrcItem.ResultFilePath
            aDstItem.UseDefaultLayout = aSrcItem.UseDefaultLayout
            aDstItem.FileNameHeader = aSrcItem.FileNameHeader
            aDstItem.ReportFormat = aSrcItem.ReportFormat
            aDstItem.Status = SS_COMMON
            
            aDst.Add aDstItem
                
            If Not aDstItem.IsActive Then
                m_nDisableReportsCount = m_nDisableReportsCount + 1
            End If

            Set aDstItem = Nothing
        Next
        
        m_bEnableAll = CBool(m_nDisableReportsCount > 0)

    '-----------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting CopyReports Exit.", GetCaption
    End If
    
End Sub

Private Function GetCurInfo() As String
    On Error Resume Next
    GetCurInfo = CStr(m_CurReport.ID & "/" & m_CurReport.LayoutFile)
End Function

Private Sub InitRisksView()
    On Error GoTo error_exception
    
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting InitRisksView Enter.", GetCaption
    End If
    '-------------------------------------------------------------------------------------------'
    
        pbProgress.Visible = False
        lblProcess.Visible = False
        lblStatus.Visible = False
        imgStop.Visible = False
        imgStopDis.Visible = False
        
        Set ctlView.m_frmOwner = Me
        Set ctlView.pbProgress = pbProgress
        Set ctlView.lblProcess = lblProcess
        Set ctlView.lblStatus = lblStatus
        Set ctlView.imgStop = imgStop
        Set ctlView.imgStopDis = imgStopDis
        
        ctlView.Init
        
    '-------------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting InitRisksView Exit.", GetCaption
    End If
    
    Exit Sub
    
error_exception:
    '-------------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting InitRisksView Exit with error: " & Err.Description, GetCaption
    End If
    
    Debug.Print "Exception in: InitRiskView() - " & Err.Description
End Sub

Private Sub ClearRisksView()
    On Error GoTo error_exception
    '----------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting ClearRisksView() Enter.", GetCaption
    End If
    '--------------------------------------------------------------------------------------'
        ctlView.Term
        pbProgress.Visible = False
        lblProcess.Visible = False
        lblStatus.Visible = False
        imgStop.Visible = False
        imgStopDis.Visible = False
    '--------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting ClearRisksView() Exit.", GetCaption
    End If
    
    Exit Sub
error_exception:
    '--------------------------------------------------------------------------------------'
    If Not g_PerformanceLog Is Nothing Then
        g_PerformanceLog.LogMmInfo enLogDebug, "BatchReporting ClearRisksView() Exit with Error: " & Err.Description, GetCaption
    End If
End Sub

Private Function GetUsedFiltersInString(ByRef aReport As clsBatchReport) As String
    On Error Resume Next
    Dim sRetValue As String
    
    sRetValue = "[NA][NA][NA][NA]"
    If (Not aReport Is Nothing) Then
    
        sRetValue = ""
        If (aReport.GroupID > 0) Then
            sRetValue = sRetValue + "[Group=" & IIf(Not g_UnderlyingGroup(aReport.GroupID) Is Nothing, g_UnderlyingGroup(aReport.GroupID).Name, "") & "]"
        Else
            sRetValue = sRetValue + "[Group=ALL]"
        End If
        
        If (aReport.TraderID > 0) Then
            sRetValue = sRetValue + "[Trader=" & IIf(Not g_Trader(aReport.TraderID) Is Nothing, g_Trader(aReport.TraderID).Name, "") & "]"
        Else
            sRetValue = sRetValue + "[Trader=ALL]"
        End If
        
        If (aReport.StrategyID > 0) Then
            sRetValue = sRetValue + "[Strategy=" & IIf(Not g_Strategy(aReport.StrategyID) Is Nothing, g_Strategy(aReport.StrategyID).Name, "") & "]"
        Else
            sRetValue = sRetValue + "[Strategy=ALL]"
        End If
        
        If (aReport.TraderGroupID > 0) Then
            sRetValue = sRetValue + "[TraderGroup=" & IIf(Not g_TraderGroup(aReport.TraderGroupID) Is Nothing, g_TraderGroup(aReport.TraderGroupID).Name, "") & "]"
        Else
            sRetValue = sRetValue + "[TraderGroup=ALL]"
        End If
            
    End If
    GetUsedFiltersInString = sRetValue
End Function

Private Function GetFileName(dtDate As Date, Optional sFileFormat As String = ".htm") As String
    On Error Resume Next
    Dim sFileName As String
    sFileName = m_CurReport.LayoutFile
    
    If (Len(Trim(m_CurReport.FileNameHeader)) > 0) Then
        sFileName = Trim(m_CurReport.FileNameHeader)
    Else
        If InStrRev(sLayout, ".") <> 0 Then
            sFileName = ExtractName(sLayout)
        End If
    End If
        
    'Show used filters in file name
    If (g_Params.BR_IncludeFilters) Then
        sFileName = sFileName & "-" & GetUsedFiltersInString(m_CurReport)
    End If
    'Show Date in file name
    If (g_Params.BR_IncludeDate) Then
        sFileName = sFileName & "-" & Format(dtDate, "YYYYMMDD")
    End If
    'Show Time Stemp in file name
    If (g_Params.BR_IncludeTime) Then
        sFileName = sFileName & "-" & Format(dtDate, "hhmm")
    End If
    
    sFileName = sFileName & sFileFormat
    
    GetFileName = sFileName
    
End Function

Private Sub tmrClearView_Timer()
    On Error Resume Next
    tmrClearView.Enabled = False
    m_bCalc = False
End Sub

Private Sub txtEmail_Change()
    On Error Resume Next
    g_Params.BR_Email = txtEmail.Text
End Sub

Private Sub SaveResults()
    On Error Resume Next
    Dim dtDate As Date
    Dim sFileName As String
    
    dtDate = Now
    sFileName = GetFileName(dtDate, IIf(m_CurReport.ReportFormat = BRF_CSV, ".csv", ".html"))
    
    If Not m_bIsRM Then
        If (m_CurReport.ReportFormat = BRF_HTML) Then
        
            ctlView.ExportToHTML sFileName, _
                                 m_CurReport.ResultFilePath, _
                                 g_Params.BR_FilterDisplay, _
                                 m_CurReport.IsPosExpanded
                                 
        ElseIf (m_CurReport.ReportFormat = BRF_CSV) Then
        
            ctlView.ExportToCSV sFileName, _
                                m_CurReport.ResultFilePath, _
                                g_Params.BR_FilterDisplay, _
                                m_CurReport.IsPosExpanded
        End If
    End If
    
    If g_Params.BR_SendEmail Then
        SendEmail g_Params.BR_Email, m_CurReport.ResultFilePath & sFileName
    End If
    
    m_CurReport.LastRun = dtDate
    m_CurReport.ResultFile = sFileName
    gDBW.usp_BR_Report_Complete m_CurReport.ID, dtDate, sFileName
    
    OnDataUpdated VUS_REPORT Or VUS_SHEDULE

    tmrClearView.Enabled = True
    
    Set m_CurReport = Nothing
    m_bManualStart = False
End Sub

Private Sub SendEmail(ByVal sEmail As String, ByVal sFile As String)
    On Error Resume Next
    MAPI_SendMail sEmail, "IvRM Batch Reporting", "", sFile
End Sub
