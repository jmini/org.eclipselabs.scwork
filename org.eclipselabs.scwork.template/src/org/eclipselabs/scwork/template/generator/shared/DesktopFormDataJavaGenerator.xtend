package org.eclipselabs.scwork.template.generator.shared

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.ProjectType
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class DesktopFormDataJavaGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.sharedIncluded && param.projectType == ProjectType.SINGLE_FORM_APPLICATION
	}
	
	override provideFile(InputParam param) {
		param.sharedSourceFile(#["services", "DesktopFormData.java"])
	}
	
	override provideContent(InputParam param) 
'''
«param.copyrightHeader»
package «param.sharedProjectName».services;

import javax.annotation.Generated;

import org.eclipse.scout.rt.shared.data.form.AbstractFormData;

/**
 * <b>NOTE:</b><br>
 * This class is auto generated by the Scout SDK. No manual modifications recommended.
 * 
 * @generated
 */
@Generated(value = "org.eclipse.scout.sdk.workspace.dto.formdata.FormDataDtoUpdateOperation", comments = "This class is auto generated by the Scout SDK. No manual modifications recommended.")
public class DesktopFormData extends AbstractFormData {

  private static final long serialVersionUID = 1L;

  public DesktopFormData() {
  }
}
'''
}
