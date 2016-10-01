Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls



Partial Class ItemsPage
    Inherits System.Web.UI.Page

    ' <summary>
    ' Fills the TreeView Control if not a postback
    ' On postbacks: Updates the TreeView to selected category
    ' and displays EITHER: CategoryPanel if the currently selected 
    ' category has child categories; OR: ItemsPanel if the currently 
    ' selected category doesn't have chile categories.
    ' Selected category is determined from query string
    ' </summary>
    Protected Sub Page_Load()

        If Not IsPostBack Then
            TreeViewCategories.Nodes.Clear()
            Dim categories As List(Of Category) = Catalog.GetChildCategories([String].Empty) ' get root level ones
            Dim c As Category
            For Each c In categories
                Dim newNode As New TreeNode(c.Title, c.Id)
                newNode.SelectAction = TreeNodeSelectAction.SelectExpand
                newNode.NavigateUrl = "Items.aspx?catId=" + c.Id
                TreeViewCategories.Nodes.Add(newNode)
                populateCategoryNode(newNode)
            Next c

            '  Restore the state of the treeview
            '
            If Not (Session("treeview") Is Nothing) Then
                Dim nodeExpandedState As Boolean() = CType(Session("treeview"), Boolean())
                Dim i As Integer = 0
                Dim n As TreeNode
                For Each n In TreeViewCategories.Nodes
                    If nodeExpandedState(i) Then
                        i = i + 1
                        n.Expand()
                    End If
                Next n
                Session.Remove("treeview")
            End If

        End If

        Dim categoryId As String = Request.QueryString.Get("catId")

        ' update TreeView by expanding to the selected category node
        If categoryId Is Nothing Then
            categoryId = String.Empty
        Else
            Dim nodeCurr As TreeNode = findNode(categoryId, TreeViewCategories.Nodes)
            LabelCurrentCategory.Text = nodeCurr.Text
            While Not (nodeCurr Is Nothing)
                nodeCurr.Expand()
                nodeCurr = nodeCurr.Parent
            End While

        End If

        ' now display the correct panel (categories or items)
        Dim currCategories As List(Of Category) = Catalog.GetChildCategories(categoryId)
        If currCategories.Count = 0 Then
            PanelItems.Visible = True
            PanelCategories.Visible = False
            GridViewItems.DataBind()
        Else
            PanelItems.Visible = False
            PanelCategories.Visible = True
            GridViewCategories.DataBind()
        End If


    End Sub 'Page_Load



    '/<summary>
    '/ Saves the expanded state of the TreeView
    '/</summary>
    Protected Sub Page_PreRender()
        Dim nodeExpandedState(TreeViewCategories.Nodes.Count) As Boolean
        Dim i As Integer = 0
        Dim node As TreeNode
        For Each node In TreeViewCategories.Nodes
            If node.Expanded.HasValue Then
                nodeExpandedState(i) = node.Expanded.Value
            End If
            i = i + 1
        Next node
        Session.Item("treeview") = nodeExpandedState
    End Sub 'Page_PreRender



    ' <summary>
    '  hides rows that have 'invisible' attribute set to false
    ' <summary>
    Protected Sub GridViewItems_RowCreated(ByVal [source] As Object, ByVal e As GridViewRowEventArgs)
        If e.Row Is Nothing Then
            Return
        End If
        If e.Row.RowType = DataControlRowType.DataRow And Not (e.Row.DataItem Is Nothing) Then
            Dim visible As Boolean = CBool(DataBinder.Eval(e.Row.DataItem, "Visible"))
            e.Row.Visible = visible
        End If
    End Sub 'GridViewItems_RowCreated



    ' <summary>
    '  searaches the nodes collection for 
    ' <summary>
    Private Function findNode(ByVal value As String, ByVal nodes As TreeNodeCollection) As TreeNode
        Dim n As TreeNode
        For Each n In nodes

            If n.Value = value Then
                Return n
                ' search n's child nodes
            Else
                Dim nChild As TreeNode = findNode(value, n.ChildNodes)
                If Not (nChild Is Nothing) Then
                    Return nChild
                End If
            End If
        Next n
        Return Nothing
    End Function 'findNode



    ' <summary>
    '  queries the datasource for child categoris and accordingly creates nodes
    ' <summary>
    Private Sub populateCategoryNode(ByVal n As TreeNode)
        Dim categories As List(Of Category) = Catalog.GetChildCategories(n.Value)

        If categories.Count = 0 Then ' base case: leaf category 
            Return
            '  recursive case : expand to show sub-categories
        Else
            Dim c As Category
            For Each c In categories
                Dim newNode As New TreeNode(c.Title, c.Id)
                newNode.SelectAction = TreeNodeSelectAction.SelectExpand
                newNode.NavigateUrl = "Items.aspx?catId=" + c.Id
                n.ChildNodes.Add(newNode)
                populateCategoryNode(newNode)
            Next c
        End If
    End Sub 'populateCategoryNode


End Class 'Items 

