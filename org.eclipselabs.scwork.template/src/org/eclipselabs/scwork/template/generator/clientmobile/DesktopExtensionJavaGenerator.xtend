package org.eclipselabs.scwork.template.generator.clientmobile

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.ProjectType
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class DesktopExtensionJavaGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uirapIncluded && param.projectType != ProjectType.EMPTY_APPLICATION
	}
	
	override provideFile(InputParam param) {
		param.clientmobileSourceFile(#["ui", "desktop", "DesktopExtension.java"])
	}
	
	override provideContent(InputParam param) 
'''
/**
 * 
 */
package «param.clientmobileProjectName».ui.desktop;

import org.eclipse.scout.commons.exception.ProcessingException;
import org.eclipse.scout.rt.client.ui.desktop.AbstractDesktopExtension;
import org.eclipse.scout.rt.client.ui.desktop.ContributionCommand;
import org.eclipse.scout.rt.shared.ui.UserAgentUtility;

import «param.clientmobileProjectName».ui.forms.MobileHomeForm;

/**
* «param.authorName.box("@author ", "")»
 */
public class DesktopExtension extends AbstractDesktopExtension {

  private MobileHomeForm m_homeForm;
  private boolean m_active;

  /**
 * 
 */
  public DesktopExtension() {
    setActive(!UserAgentUtility.isDesktopDevice());

  }

  @Override
  protected ContributionCommand execGuiAttached() throws ProcessingException {
    if (!isActive()) {
      return super.execGuiAttached();
    }

    if (m_homeForm == null) {
      m_homeForm = new MobileHomeForm();
      m_homeForm.startView();
    }
    return ContributionCommand.Continue;

  }

  @Override
  protected ContributionCommand execGuiDetached() throws ProcessingException {
    if (!isActive()) {
      return super.execGuiDetached();
    }

    if (m_homeForm != null) {
      m_homeForm.doClose();
    }
    return ContributionCommand.Continue;

  }

  /**
   * @return the Active
   */
  public boolean isActive() {
    return m_active;
  }

  /**
   * @param active
   *          the Active to set
   */
  public void setActive(boolean active) {
    m_active = active;
  }
}
'''
}
