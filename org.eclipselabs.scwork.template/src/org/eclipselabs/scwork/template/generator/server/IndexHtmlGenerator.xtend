package org.eclipselabs.scwork.template.generator.server

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class IndexHtmlGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.serverIncluded
	}
	
	override provideFile(InputParam param) {
		param.serverFile(#["resources", "html", "index.html"])
	}
	
	override provideContent(InputParam param) 
'''
<html>
   <head>
      <title>«param.projectAlias»</title>
<!--    <link rel="shortcut icon" href="favicon.ico">  -->
      <style type="text/css">
         <!--
            p, td, a  { font-family: Arial, Helvetica, sans-serif; font-size: 14; text-indent: 0pt }
            a:link    { color: #0082A1; text-decoration: none }
            a:visited { color: #0082A1; text-decoration: none }
            a:active  { color: #0082A1; text-decoration: none }
            a:hover   { color: #FE9915; text-decoration: underline }
         //-->
      </style>
   </head>
   <body>

      <div align="center">
         <p align="center">&nbsp;</p>
         <p align="center">
            <img src="./scout.gif" alt=""  width="150" height="150" border="0">
            <br/>&nbsp;<br/>
            <a href="./«param.projectAlias»Client.zip"><font color="#FE9915" size="5"><b>Download</b></font></a>
         </p>
         <table border="0" cellpadding="5" cellspacing="20" width="640" id="table1">
            <tr>
               <td width="300" align="center" bgcolor="#0082A1"><font color="#FFFFFF"><b>Installation of «param.projectAlias»</b></font></td>
            </tr>
            <tr>
               <td width="300" valign="top">
                  <p align="left">
                     «param.projectAlias» has to be installed on your computer before use.
                  </p>
                  <p align="center">
                     [ <a href="./«param.projectAlias»Client.zip">«param.projectAlias».zip</a> ]
                  </p>
                  <p align="left">
                     Carry out the following steps:
                  </p>
                  <p align="left">
                     <ol>
                        <li>Download the above *.ZIP-file.</li>
                        <li>Unzip the file to a directory of your choice.</li>
                        <li>Start «param.projectAlias»  with the file <i>«param.projectAlias».exe</i>.</li>
                    </ol>
                  </p>
               </td>
            </tr>
         </table>

         <p align="center">
            <font size="2">
            <br/>
            [ <a href="http://www.eclipse.org/scout">Eclipse Scout</a> ]
            <br/>
            </font>
         </p>
      </div>
   </body>
</html>
'''
}
