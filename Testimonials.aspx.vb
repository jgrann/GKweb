Imports System
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls


Partial Class TestimonialsPage
    Inherits System.Web.UI.Page

    Protected Sub GridView1_RowCreated(ByVal [source] As Object, ByVal e As GridViewRowEventArgs)
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
    End Sub 'GridView1_RowCreated
End Class 'Testimonials

