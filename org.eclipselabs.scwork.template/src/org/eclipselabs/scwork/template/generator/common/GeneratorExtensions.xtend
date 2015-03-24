package org.eclipselabs.scwork.template.generator.common

import java.io.File
import java.util.ArrayList
import java.util.List
import org.eclipselabs.scwork.template.InputParam

class GeneratorExtensions {

	def static clientProjectName(InputParam param) {
		computeProjectName(param, "client")
	}

	def static clientmobileProjectName(InputParam param) {
		computeProjectName(param, "client.mobile")
//		clientProjectName(param) + ".mobile"
	}

	def static serverProjectName(InputParam param) {
		computeProjectName(param, "server")
	}

	def static sharedProjectName(InputParam param) {
		computeProjectName(param, "shared")
	}

	def static uirapProjectName(InputParam param) {
		computeProjectName(param, "ui.rap")
	}

	def static uiswingProjectName(InputParam param) {
		computeProjectName(param, "ui.swing")
	}

	def static uiswtProjectName(InputParam param) {
		computeProjectName(param, "ui.swt")
	}

	def static targetProjectName(InputParam param) {
		computeProjectName(param, "target")
	}
	
	private def static computeProjectName(InputParam param, String projectName) {
		return #[param.projectName, projectName, param.projectPostfix].filterNull.join(".")
	}

	def static clientFile(InputParam param, String fileName) {
		clientFile(param, #[fileName])
	}
	
	def static clientSourceFile(InputParam param, List<String> names) {
		val l = new ArrayList<String>
		l.add("src")
		l.addAll(param.clientProjectName.split("\\."))
		l.addAll(names)
		clientFile(param, l)
	}

	def static clientFile(InputParam param, List<String> names) {
		val l = new ArrayList<String>
		l.add(param.clientProjectName)
		l.addAll(names)
		computeFilePath(param.workspaceFolder, l)
	}

	def static clientmobileFile(InputParam param, String fileName) {
		clientmobileFile(param, #[fileName])
	}
	
	def static clientmobileSourceFile(InputParam param, List<String> names) {
		val l = new ArrayList<String>
		l.add("src")
		l.addAll(param.clientmobileProjectName.split("\\."))
		l.addAll(names)
		clientmobileFile(param, l)
	}

	def static clientmobileFile(InputParam param, List<String> names) {
		val l = new ArrayList<String>
		l.add(param.clientmobileProjectName)
		l.addAll(names)
		computeFilePath(param.workspaceFolder, l)
	}

	def static serverFile(InputParam param, String fileName) {
		serverFile(param, #[fileName])
	}
	
	def static serverSourceFile(InputParam param, List<String> names) {
		val l = new ArrayList<String>
		l.add("src")
		l.addAll(param.serverProjectName.split("\\."))
		l.addAll(names)
		serverFile(param, l)
	}

	def static serverFile(InputParam param, List<String> names) {
		val l = new ArrayList<String>
		l.add(param.serverProjectName)
		l.addAll(names)
		computeFilePath(param.workspaceFolder, l)
	}

	def static sharedFile(InputParam param, String fileName) {
		sharedFile(param, #[fileName])
	}
	
	def static sharedSourceFile(InputParam param, List<String> names) {
		val l = new ArrayList<String>
		l.add("src")
		l.addAll(param.sharedProjectName.split("\\."))
		l.addAll(names)
		sharedFile(param, l)
	}

	def static sharedFile(InputParam param, List<String> names) {
		val l = new ArrayList<String>
		l.add(param.sharedProjectName)
		l.addAll(names)
		computeFilePath(param.workspaceFolder, l)
	}

	def static uirapFile(InputParam param, String fileName) {
		uirapFile(param, #[fileName])
	}
	
	def static uirapSourceFile(InputParam param, List<String> names) {
		val l = new ArrayList<String>
		l.add("src")
		l.addAll(param.uirapProjectName.split("\\."))
		l.addAll(names)
		uirapFile(param, l)
	}

	def static uirapFile(InputParam param, List<String> names) {
		val l = new ArrayList<String>
		l.add(param.uirapProjectName)
		l.addAll(names)
		computeFilePath(param.workspaceFolder, l)
	}

	def static uiswingFile(InputParam param, String fileName) {
		uiswingFile(param, #[fileName])
	}
	
	def static uiswingSourceFile(InputParam param, List<String> names) {
		val l = new ArrayList<String>
		l.add("src")
		l.addAll(param.uiswingProjectName.split("\\."))
		l.addAll(names)
		uiswingFile(param, l)
	}

	def static uiswingFile(InputParam param, List<String> names) {
		val l = new ArrayList<String>
		l.add(param.uiswingProjectName)
		l.addAll(names)
		computeFilePath(param.workspaceFolder, l)
	}
	
	def static uiswtFile(InputParam param, String fileName) {
		uiswtFile(param, #[fileName])
	}
	
	def static uiswtSourceFile(InputParam param, List<String> names) {
		val l = new ArrayList<String>
		l.add("src")
		l.addAll(param.uiswtProjectName.split("\\."))
		l.addAll(names)
		uiswtFile(param, l)
	}

	def static uiswtFile(InputParam param, List<String> names) {
		val l = new ArrayList<String>
		l.add(param.uiswtProjectName)
		l.addAll(names)
		computeFilePath(param.workspaceFolder, l)
	}
	
	def static targetFile(InputParam param, String fileName) {
		targetFile(param, #[fileName])
	}
	
	def static targetFile(InputParam param, List<String> names) {
		val l = new ArrayList<String>
		l.add(param.targetProjectName)
		l.addAll(names)
		computeFilePath(param.workspaceFolder, l)
	}

	private def static computeFilePath(File root, List<String> parts) {
		parts.fold(root, [f, s | new File(f, s)])
	}
	
	def static box(String content, String before, String after) {
		val sb = new StringBuilder
		if(!content.nullOrEmpty) {
			if(!before.nullOrEmpty) {
				sb.append(before)
			}
			sb.append(content)
			if(!after.nullOrEmpty) {
				sb.append(after)
			}
		}
		sb.toString
	}
	
	def static <T> List<T> notNull(List<T> list) {
		if(list == null) {
			#[]
		} else {
			list
		}
	}
}