package org.eclipselabs.scwork.template.generator.uiswt

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class DesktopMenuBarJavaGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.uiswtIncluded
	}
	
	override provideFile(InputParam param) {
		param.uiswtSourceFile(#["application", "menu", "DesktopMenuBar.java"])
	}
	
	override provideContent(InputParam param) 
'''
«param.copyrightHeader»
package «param.uiswtProjectName».application.menu;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.jface.action.IContributionItem;
import org.eclipse.jface.action.IMenuManager;
import org.eclipse.scout.rt.client.ui.action.menu.IMenu;
import org.eclipse.scout.rt.client.ui.action.menu.MenuUtility;
import org.eclipse.scout.rt.ui.swt.ISwtEnvironment;
import org.eclipse.scout.rt.ui.swt.action.menu.SwtScoutMenuContributionItem;
import org.eclipse.ui.actions.CompoundContributionItem;

import «param.uiswtProjectName».Activator;

public class DesktopMenuBar extends CompoundContributionItem {

  @Override
  protected IContributionItem[] getContributionItems() {
    ISwtEnvironment env = Activator.getDefault().getEnvironment();
    if (env != null && env.isInitialized()) {
      if (env.getClientSession() != null && env.getClientSession().getDesktop() != null) {
        List<IMenu> menus = env.getClientSession().getDesktop().getMenus();
        List<IMenu> consolidatedMenus = MenuUtility.consolidateMenus(menus);
        List<IContributionItem> swtContributionItems = new ArrayList<IContributionItem>();
        for (IMenu menu : consolidatedMenus) {
          swtContributionItems.add(new SwtScoutMenuContributionItem(menu, env));
        }
        return swtContributionItems.toArray(new IContributionItem[swtContributionItems.size()]);
      }
    }
    return new IContributionItem[0];
  }

  @Override
  public boolean isDirty() {
    boolean isDirty = super.isDirty();
    if (!isDirty && getParent() instanceof IMenuManager) {
      isDirty = ((IMenuManager) getParent()).isDirty();
    }
    return isDirty;
  }
}
'''
}
