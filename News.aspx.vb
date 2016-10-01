
Partial Class NewsPage
    Inherits System.Web.UI.Page

    '<summary>
    ' Shows the Panel dispalaing individual news item 
    ' and hides the Panel that displays the list of news items 
    ' Also hides the image if none is defined
    '</summary>
    Protected Sub Page_Load()

        ' show all news or just one item depending on querystring
        Dim newsItemId As String = Request.QueryString.Get("newsId")
        If newsItemId Is Nothing Then

            AllNewsPanel.Visible = True
            NewsDetailPanel.Visible = False
            GridViewAllNews.DataBind()
        Else
            AllNewsPanel.Visible = False
            NewsDetailPanel.Visible = True
            DetailsView1.DataBind()
        End If
    End Sub


    Protected Sub GridViewAllNews_RowCreated(ByVal [source] As Object, ByVal e As GridViewRowEventArgs)
        If e.Row Is Nothing Then
            Return
        End If
        ' display if 'Visible' = true
        If e.Row.RowType = DataControlRowType.DataRow And Not (e.Row.DataItem Is Nothing) Then
            Dim visible As Boolean = CBool(DataBinder.Eval(e.Row.DataItem, "Visible"))
            e.Row.Visible = visible
        End If

        ' display image if a url is specifid
        Dim imageUrl As String = CStr(DataBinder.Eval(e.Row.DataItem, "ImageUrl"))
        If [String].Empty.Equals(imageUrl) Then
            Dim newsImage As Image = CType(e.Row.FindControl("Image2"), Image)
            If Not (newsImage Is Nothing) Then
                newsImage.Visible = False
            End If
        End If
    End Sub 'GridViewAllNews_RowCreated

End Class 'News


