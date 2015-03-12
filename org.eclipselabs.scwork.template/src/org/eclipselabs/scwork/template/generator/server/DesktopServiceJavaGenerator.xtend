package org.eclipselabs.scwork.template.generator.server

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.ProjectType
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class DesktopServiceJavaGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.serverIncluded && param.projectType == ProjectType.SINGLE_FORM_APPLICATION
	}
	
	override provideFile(InputParam param) {
		param.serverSourceFile(#["services", "DesktopService.java"])
	}
	
	override provideContent(InputParam param) 
'''
«param.copyrightHeader»
package «param.serverProjectName».services;

import org.eclipse.scout.commons.exception.ProcessingException;
import org.eclipse.scout.service.AbstractService;

import «param.sharedProjectName».services.DesktopFormData;
import «param.sharedProjectName».services.IDesktopService;

/**
 * «param.authorName.box("@author ", "")»
 */
public class DesktopService extends AbstractService implements IDesktopService {

  @Override
  public DesktopFormData load(DesktopFormData formData) throws ProcessingException {
    //TODO [jbr] Auto-generated method stub.
    return formData;
  }
}
'''
}
