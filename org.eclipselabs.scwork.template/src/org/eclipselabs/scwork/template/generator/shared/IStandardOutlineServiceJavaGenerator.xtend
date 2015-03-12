package org.eclipselabs.scwork.template.generator.shared

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.ProjectType
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class IStandardOutlineServiceJavaGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.sharedIncluded && param.projectType == ProjectType.OUTLINE_BASED_APPLICATION
	}
	
	override provideFile(InputParam param) {
		param.sharedSourceFile(#["services", "IStandardOutlineService.java"])
	}
	
	override provideContent(InputParam param) 
'''
«param.copyrightHeader»
package «param.sharedProjectName».services;

import org.eclipse.scout.service.IService;

/**
 * «param.authorName.box("@author ", "")»
 */
public interface IStandardOutlineService extends IService {
}
'''
}
