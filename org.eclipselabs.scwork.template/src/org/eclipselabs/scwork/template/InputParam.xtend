package org.eclipselabs.scwork.template

import java.io.File
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors class InputParam {
	File workspaceFolder
	
	String projectName
	String projectPostfix
	String projectAlias
	
	boolean clientIncluded = true
	boolean serverIncluded = true
	boolean sharedIncluded = true
	boolean uirapIncluded = true
	boolean uiswingIncluded = true
	boolean uiswtIncluded = true
	
	ProjectType projectType = ProjectType.SINGLE_FORM_APPLICATION
	
	String authorName
	String copyrightHeader = '''
/**
 * 
 */'''
}