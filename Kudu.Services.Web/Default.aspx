﻿<%@ Page Language="C#" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="Kudu.Services.Web" %>
<%@ Import Namespace="Kudu.Services" %>
<%@ Import Namespace="System.Web.Hosting" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Kudu Services</title>
    <style type="text/css">
        body
        {
            color: #646465;
            font-family: 'Segoe UI', "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 12px;
            margin-left: 2%;
        }
        
        a {
            color: blue;
            text-decoration: none;
        }
        
        a:visited {
            color: blue;
        }
        
        a:hover {
            text-decoration: underline;
        }
        
        h1
        {
            padding-top: 20px;
            font-size: 20px;
        }
        
        table {
            border-collapse: collapse;
            font-family: 'Segoe UI', "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 13px;
        }
        
        table td {
            padding: 4px;
        }
        
        #footer {
            text-align: center;
        }
        
        .header {
            font-size: 15px;
            font-weight: bold;
            border-bottom:1px solid #ccc; 
            width:30%; 
            margin-top:40px;
            margin-bottom:5px;
        }
        
        ul li {
           margin-top: 5px;
        }
        
        .path {
            font-family: Consolas;
        }
        
        #sha {
            font-size: 12px;
            font-weight: normal;
        }
        
        #update-link {
            font-size: 12px;
            font-weight: normal;
        }
        
    </style>
    <head>
</head>
</head>
<body>
    <div>
        <%
            string commitFile = MapPath("~/commit.txt");
            string sha = File.Exists(commitFile) ? File.ReadAllText(commitFile).Trim() : null;
            var version = typeof(Kudu.Services.Web.Tracing.TraceModule).Assembly.GetName().Version;
        %>
        
        <h1>Kudu - Build <%= version %>
        <% if (!String.IsNullOrEmpty(sha)) { %>
        (<a id="sha" href="https://github.com/projectkudu/kudu/commit/<%= sha %>"><%= sha.Substring(0, 10) %></a>)
        <% } %>
        </h1>
    </div>
    
    <div class="header">Environment</div>

    <table>
        <tr>
            <%
                var upTime = Kudu.Services.Web.Tracing.TraceModule.UpTime.ToString();
            %>
            <td><strong>Site up time</strong></td>
            <td><%= upTime %></td>
        </tr>
        <tr>
            <td><strong>Site folder</strong></td>
            <td class="path"><%= MapPath("_app") %></td>
        </tr>
        <tr>
            <td><strong>Temp folder</strong></td>
            <td class="path"><%= Path.GetTempPath() %></td>
        </tr>
        <tr>
            <td><strong>Runtime environment</strong></td>
            <td><a href="Env.aspx">View</a></td>
        </tr>

        <tr>
            <td><strong>Diagnostic dump</strong></td>
            <td><a href="dump">Download</a></td>
        </tr>
        <tr>
            <td><strong>Diagnostic console</strong></td>
            <td><a href="DebugConsole">Launch</a>&nbsp;&nbsp;This is an experimental feature.</td>
        </tr>
        <tr>
            <td><strong>Diagnostic log stream</strong></td>
            <td><a href="logstream">Stream</a>&nbsp;&nbsp;If no log events are being generated the page may not load.</td>
        </tr>

    </table>

    <div class="header">REST API (works best when using a JSON viewer extension)</div>

    <table>
        <tr>
            <td><strong>Deployments</strong></td>
            <td><a href="deployments">Browse</a></td>
        </tr>
        <tr>
            <td><strong>Files</strong></td>
            <td><a href="vfs">Browse</a></td>
        </tr>
        <tr>
            <td><strong>App settings</strong></td>
            <td><a href="settings">Browse</a></td>
        </tr>
        <tr>
            <td><strong>Processes and mini-dumps</strong></td>
            <td><a href="diagnostics/processes">Browse</a></td>
        </tr>
        <tr>
            <td><strong>Source control info</strong></td>
            <td><a href="scm/info">Browse</a></td>
        </tr>
        <tr>
            <td><strong>Web hooks</strong></td>
            <td><a href="hooks">Browse</a></td>
        </tr>
    </table>
</body>
</html>
