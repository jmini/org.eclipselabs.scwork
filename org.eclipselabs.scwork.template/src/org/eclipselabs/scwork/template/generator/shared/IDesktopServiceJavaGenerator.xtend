package org.eclipselabs.scwork.template.generator.shared

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.ProjectType
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class IDesktopServiceJavaGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.sharedIncluded && param.projectType == ProjectType.SINGLE_FORM_APPLICATION
	}
	
	override provideFile(InputParam param) {
		param.sharedSourceFile(#["services", "IDesktopService.java"])
	}
	
	override provideContent(InputParam param) 
'''
«param.copyrightHeader»
package «param.sharedProjectName».services;

import org.eclipse.scout.commons.exception.ProcessingException;
import org.eclipse.scout.rt.shared.validate.IValidationStrategy;
import org.eclipse.scout.rt.shared.validate.InputValidation;
import org.eclipse.scout.service.IService;

/**
 * «param.authorName.box("@author ", "")»
 */
@InputValidation(IValidationStrategy.PROCESS.class)
public interface IDesktopService extends IService {

  /**
   * @param formData
   * @return
   * @throws org.eclipse.scout.commons.exception.ProcessingException
   */
  DesktopFormData load(DesktopFormData formData) throws ProcessingException;
}
'''
}
