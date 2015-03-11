package org.eclipselabs.scwork.template.generator.client

import org.eclipselabs.scwork.template.InputParam
import org.eclipselabs.scwork.template.ProjectType
import org.eclipselabs.scwork.template.generator.ITextFileGenerator

import static extension org.eclipselabs.scwork.template.generator.common.GeneratorExtensions.*

class DesktopJavaGenerator implements ITextFileGenerator {
	
	override shouldGenerate(InputParam param) {
		param.clientIncluded
	}
	
	override provideFile(InputParam param) {
		param.clientSourceFile(#["ui", "desktop", "Desktop.java"])
	}
	
	override provideContent(InputParam param) {
		switch(param.projectType) {
			case ProjectType.EMPTY_APPLICATION : {
				param.provideEmptyApplicationContent
			}
			case ProjectType.OUTLINE_BASED_APPLICATION : {
				param.provideOutlineBasedApplicationContent
			}
			case ProjectType.SINGLE_FORM_APPLICATION : {
				param.provideSingleFormApplicationContent
			}
			default : {
				throw new IllegalStateException("Unknown application type")
			}
		}
	}
	
	def String provideEmptyApplicationContent(InputParam param) 
'''
package «param.clientProjectName».ui.desktop;

import org.eclipse.scout.commons.annotations.Order;
import org.eclipse.scout.commons.exception.ProcessingException;
import org.eclipse.scout.commons.logger.IScoutLogger;
import org.eclipse.scout.commons.logger.ScoutLogManager;
import org.eclipse.scout.rt.client.ClientSyncJob;
import org.eclipse.scout.rt.client.ui.action.keystroke.AbstractKeyStroke;
import org.eclipse.scout.rt.client.ui.action.menu.AbstractMenu;
import org.eclipse.scout.rt.client.ui.desktop.IDesktop;
import org.eclipse.scout.rt.client.ui.desktop.bookmark.menu.AbstractBookmarkMenu;
import org.eclipse.scout.rt.client.ui.desktop.outline.pages.IPage;
import org.eclipse.scout.rt.client.ui.form.ScoutInfoForm;
import org.eclipse.scout.rt.extension.client.ui.desktop.AbstractExtensibleDesktop;
import org.eclipse.scout.rt.shared.TEXTS;

import «param.clientProjectName».ClientSession;

public class Desktop extends AbstractExtensibleDesktop implements IDesktop {
  private static IScoutLogger logger = ScoutLogManager.getLogger(Desktop.class);

  public Desktop() {
  }

  @Override
  protected String getConfiguredTitle() {
    return TEXTS.get("ApplicationTitle");
  }

  @Order(10.0)
  public class FileMenu extends AbstractMenu {

    @Override
    protected String getConfiguredText() {
      return TEXTS.get("FileMenu");
    }

    @Order(100.0)
    public class ExitMenu extends AbstractMenu {

      @Override
      protected String getConfiguredText() {
        return TEXTS.get("ExitMenu");
      }

      @Override
      public void execAction() throws ProcessingException {
        ClientSyncJob.getCurrentSession(ClientSession.class).stopSession();
      }
    }
  }

  @Order(20.0)
  public class ToolsMenu extends AbstractMenu {

    @Override
    protected String getConfiguredText() {
      return TEXTS.get("ToolsMenu");
    }
  }

  @Order(25)
  public class BookmarkMenu extends AbstractBookmarkMenu {
    public BookmarkMenu() {
      super(Desktop.this);
    }
  }

  @Order(30.0)
  public class HelpMenu extends AbstractMenu {

    @Override
    protected String getConfiguredText() {
      return TEXTS.get("HelpMenu");
    }

    @Order(10.0)
    public class AboutMenu extends AbstractMenu {

      @Override
      protected String getConfiguredText() {
        return TEXTS.get("AboutMenu");
      }

      @Override
      public void execAction() throws ProcessingException {
        ScoutInfoForm form = new ScoutInfoForm();
        form.startModify();
      }
    }
  }

  @Order(10.0)
  public class RefreshOutlineKeyStroke extends AbstractKeyStroke {

    @Override
    protected String getConfiguredKeyStroke() {
      return "f5";
    }

    @Override
    protected void execAction() throws ProcessingException {
      if (getOutline() != null) {
        IPage page = getOutline().getActivePage();
        if (page != null) {
          page.reloadPage();
        }
      }
    }
  }
}
'''

	def String provideOutlineBasedApplicationContent(InputParam param) 
'''
package «param.clientProjectName».ui.desktop;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.scout.commons.CollectionUtility;
import org.eclipse.scout.commons.annotations.Order;
import org.eclipse.scout.commons.exception.ProcessingException;
import org.eclipse.scout.commons.logger.IScoutLogger;
import org.eclipse.scout.commons.logger.ScoutLogManager;
import org.eclipse.scout.rt.client.ClientSyncJob;
import org.eclipse.scout.rt.client.ui.action.keystroke.AbstractKeyStroke;
import org.eclipse.scout.rt.client.ui.action.menu.AbstractMenu;
import org.eclipse.scout.rt.client.ui.desktop.IDesktop;
import org.eclipse.scout.rt.client.ui.desktop.bookmark.menu.AbstractBookmarkMenu;
import org.eclipse.scout.rt.client.ui.desktop.outline.AbstractOutlineViewButton;
import org.eclipse.scout.rt.client.ui.desktop.outline.IOutline;
import org.eclipse.scout.rt.client.ui.desktop.outline.pages.IPage;
import org.eclipse.scout.rt.client.ui.form.ScoutInfoForm;
import org.eclipse.scout.rt.client.ui.form.outline.DefaultOutlineTableForm;
import org.eclipse.scout.rt.client.ui.form.outline.DefaultOutlineTreeForm;
import org.eclipse.scout.rt.extension.client.ui.desktop.AbstractExtensibleDesktop;
import org.eclipse.scout.rt.shared.TEXTS;
import org.eclipse.scout.rt.shared.ui.UserAgentUtility;

import «param.clientProjectName».ClientSession;
import «param.clientProjectName».ui.desktop.outlines.StandardOutline;
import «param.sharedProjectName».Icons;

public class Desktop extends AbstractExtensibleDesktop implements IDesktop {
  private static IScoutLogger logger = ScoutLogManager.getLogger(Desktop.class);

  public Desktop() {
  }

  @Override
  protected List<Class<? extends IOutline>> getConfiguredOutlines() {
    List<Class<? extends IOutline>> outlines = new ArrayList<Class<? extends IOutline>>();
    outlines.add(StandardOutline.class);
    return outlines;
  }

  @Override
  protected String getConfiguredTitle() {
    return TEXTS.get("ApplicationTitle");
  }

  @Override
  protected void execOpened() throws ProcessingException {
    //If it is a mobile or tablet device, the DesktopExtension in the mobile plugin takes care of starting the correct forms.
    if (!UserAgentUtility.isDesktopDevice()) {
      return;
    }

    // outline tree
    DefaultOutlineTreeForm treeForm = new DefaultOutlineTreeForm();
    treeForm.setIconId(Icons.EclipseScout);
    treeForm.startView();

    //outline table
    DefaultOutlineTableForm tableForm = new DefaultOutlineTableForm();
    tableForm.setIconId(Icons.EclipseScout);
    tableForm.startView();

    IOutline firstOutline = CollectionUtility.firstElement(getAvailableOutlines());
    if (firstOutline != null) {
      setOutline(firstOutline);
    }

  }

  @Order(10.0)
  public class FileMenu extends AbstractMenu {

    @Override
    protected String getConfiguredText() {
      return TEXTS.get("FileMenu");
    }

    @Order(100.0)
    public class ExitMenu extends AbstractMenu {

      @Override
      protected String getConfiguredText() {
        return TEXTS.get("ExitMenu");
      }

      @Override
      public void execAction() throws ProcessingException {
        ClientSyncJob.getCurrentSession(ClientSession.class).stopSession();
      }
    }
  }

  @Order(20.0)
  public class ToolsMenu extends AbstractMenu {

    @Override
    protected String getConfiguredText() {
      return TEXTS.get("ToolsMenu");
    }
  }

  @Order(25)
  public class BookmarkMenu extends AbstractBookmarkMenu {
    public BookmarkMenu() {
      super(Desktop.this);
    }
  }

  @Order(30.0)
  public class HelpMenu extends AbstractMenu {

    @Override
    protected String getConfiguredText() {
      return TEXTS.get("HelpMenu");
    }

    @Order(10.0)
    public class AboutMenu extends AbstractMenu {

      @Override
      protected String getConfiguredText() {
        return TEXTS.get("AboutMenu");
      }

      @Override
      public void execAction() throws ProcessingException {
        ScoutInfoForm form = new ScoutInfoForm();
        form.startModify();
      }
    }
  }

  @Order(10.0)
  public class RefreshOutlineKeyStroke extends AbstractKeyStroke {

    @Override
    protected String getConfiguredKeyStroke() {
      return "f5";
    }

    @Override
    protected void execAction() throws ProcessingException {
      if (getOutline() != null) {
        IPage page = getOutline().getActivePage();
        if (page != null) {
          page.reloadPage();
        }
      }
    }
  }

  @Order(10.0)
  public class StandardOutlineViewButton extends AbstractOutlineViewButton {

    /**
   * 
   */
    public StandardOutlineViewButton() {
      super(Desktop.this, StandardOutline.class);
    }
  }
}
'''
	def String provideSingleFormApplicationContent(InputParam param) 
'''
package «param.clientProjectName».ui.desktop;

import org.eclipse.scout.commons.annotations.Order;
import org.eclipse.scout.commons.exception.ProcessingException;
import org.eclipse.scout.commons.logger.IScoutLogger;
import org.eclipse.scout.commons.logger.ScoutLogManager;
import org.eclipse.scout.rt.client.ClientSyncJob;
import org.eclipse.scout.rt.client.ui.action.keystroke.AbstractKeyStroke;
import org.eclipse.scout.rt.client.ui.action.menu.AbstractMenu;
import org.eclipse.scout.rt.client.ui.desktop.IDesktop;
import org.eclipse.scout.rt.client.ui.desktop.bookmark.menu.AbstractBookmarkMenu;
import org.eclipse.scout.rt.client.ui.desktop.outline.pages.IPage;
import org.eclipse.scout.rt.client.ui.form.ScoutInfoForm;
import org.eclipse.scout.rt.extension.client.ui.desktop.AbstractExtensibleDesktop;
import org.eclipse.scout.rt.shared.TEXTS;
import org.eclipse.scout.rt.shared.ui.UserAgentUtility;

import «param.clientProjectName».ClientSession;
import «param.clientProjectName».ui.forms.DesktopForm;
import «param.sharedProjectName».Icons;

public class Desktop extends AbstractExtensibleDesktop implements IDesktop {
  private static IScoutLogger logger = ScoutLogManager.getLogger(Desktop.class);

  public Desktop() {
  }

  @Override
  protected String getConfiguredTitle() {
    return TEXTS.get("ApplicationTitle");
  }

  @Override
  protected void execOpened() throws ProcessingException {
    //If it is a mobile or tablet device, the DesktopExtension in the mobile plugin takes care of starting the correct forms.
    if (!UserAgentUtility.isDesktopDevice()) {
      return;
    }
    DesktopForm desktopForm = new DesktopForm();
    desktopForm.setIconId(Icons.EclipseScout);
    desktopForm.startView();
  }

  @Order(10.0)
  public class FileMenu extends AbstractMenu {

    @Override
    protected String getConfiguredText() {
      return TEXTS.get("FileMenu");
    }

    @Order(100.0)
    public class ExitMenu extends AbstractMenu {

      @Override
      protected String getConfiguredText() {
        return TEXTS.get("ExitMenu");
      }

      @Override
      public void execAction() throws ProcessingException {
        ClientSyncJob.getCurrentSession(ClientSession.class).stopSession();
      }
    }
  }

  @Order(20.0)
  public class ToolsMenu extends AbstractMenu {

    @Override
    protected String getConfiguredText() {
      return TEXTS.get("ToolsMenu");
    }
  }

  @Order(25)
  public class BookmarkMenu extends AbstractBookmarkMenu {
    public BookmarkMenu() {
      super(Desktop.this);
    }
  }

  @Order(30.0)
  public class HelpMenu extends AbstractMenu {

    @Override
    protected String getConfiguredText() {
      return TEXTS.get("HelpMenu");
    }

    @Order(10.0)
    public class AboutMenu extends AbstractMenu {

      @Override
      protected String getConfiguredText() {
        return TEXTS.get("AboutMenu");
      }

      @Override
      public void execAction() throws ProcessingException {
        ScoutInfoForm form = new ScoutInfoForm();
        form.startModify();
      }
    }
  }

  @Order(10.0)
  public class RefreshOutlineKeyStroke extends AbstractKeyStroke {

    @Override
    protected String getConfiguredKeyStroke() {
      return "f5";
    }

    @Override
    protected void execAction() throws ProcessingException {
      if (getOutline() != null) {
        IPage page = getOutline().getActivePage();
        if (page != null) {
          page.reloadPage();
        }
      }
    }
  }
}
'''
}
