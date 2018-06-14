﻿Imports DataConnection
Imports InfoSoftGlobal
Partial Class DB_DrillDown_Default
    Inherits System.Web.UI.Page
    Public Function CreateChart() As String
        'In this example, we show how to connect FusionCharts to a database.
        'For the sake of ease, we've used an Access database which is present in
        '../App_Data/FactoryDB.mdb. It just contains two tables, which are linked to each
        'other. 

        'Database Objects - Initialization
        Dim oRs As DbConn, strQuery As String
        'strXML will be used to store the entire XML document generated
        Dim strXML As String

        'Generate the graph element
        strXML = "<graph caption='Factory Output report' subCaption='By Quantity' decimalPrecision='0' showNames='1' numberSuffix=' Units' pieSliceDepth='30'  formatNumberScale='0' >"

        'Iterate through each factory
        strQuery = "select * from Factory_Master"
        oRs = New DbConn(strQuery)

        While oRs.ReadData.Read()
            'Now create second recordset to get details for this factory
            strQuery = "select sum(Quantity) as TotOutput from Factory_Output where FactoryId=" & oRs.ReadData("FactoryId").ToString()
            Dim oRs2 As New DbConn(strQuery)
            oRs2.ReadData.Read()
            'Generate <set name='..' value='..' link='..' />
            'Note that we're setting link as Detailed.asp?FactoryId=<<FactoryId>>
            strXML = strXML & "<set name='" & oRs.ReadData("FactoryName").ToString() & "' value='" & oRs2.ReadData("TotOutput").ToString() & "' link='" & Server.UrlEncode("Detailed.aspx?FactoryId=" & oRs.ReadData("FactoryId").ToString()) & "'/>"
            'Close recordset
            oRs2.ReadData.Close()

        End While
        'Finally, close <graph> element
        strXML = strXML & "</graph>"
        oRs.ReadData.Close()

        'Create the chart - Pie 3D Chart with data from strXML
        Return FusionCharts.RenderChart("../FusionCharts/FCF_Pie3D.swf", "", strXML, "FactorySum", "650", "450", False, False)
    End Function
End Class
