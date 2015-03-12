package org.eclipselabs.scwork.template.generator.server

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.ProjectType
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class StandardOutlineServiceJavaGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.serverIncluded && param.projectType == ProjectType.OUTLINE_BASED_APPLICATION
	}
	
	override provideFile(InputParam param) {
		param.serverSourceFile(#["services", "StandardOutlineService.java"])
	}
	
	override provideContent(InputParam param) 
'''
«param.copyrightHeader»
package «param.serverProjectName».services;

import org.eclipse.scout.service.AbstractService;

import «param.sharedProjectName».services.IStandardOutlineService;

/**
 * «param.authorName.box("@author ", "")»
 */
public class StandardOutlineService extends AbstractService implements IStandardOutlineService {
}
'''
}
