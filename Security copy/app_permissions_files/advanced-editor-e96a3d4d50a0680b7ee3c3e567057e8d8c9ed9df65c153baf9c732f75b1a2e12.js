try{$.blockUI.defaults.showOverlay=!1}catch(e){}BSC.Editor.setDirty(!1),BSC.Editor.initCKEditors(),BSC.Editor.attachAutosaveEvents(),BSC.Editor.attachRedirectsOnNextAndCardSelector(),BSC.Editor.initMediaUploaders(),BSC.Editor.initContextMenus(),BSC.Editor.initMiscDialogs(),$(function(){BSC.Editor.initTooltips(),$("#form").on("keydown","input[type='text'], form textarea",BSC.Editor.EventHandlers.textFieldKeyDown).on("blur","input[type='text'], form textarea",function(){BSC.Editor.save()}).on("click","input[type='checkbox'], input[type='radio']",function(){BSC.Editor.setDirty(!0)}).on("click","input[type='checkbox'], input[type='radio']",function(){BSC.Editor.save()}),$("#save_button").click(BSC.Editor.EventHandlers.saveButtonClick),$("#card_prompt").keyup(BSC.Editor.EventHandlers.cardPromptKeyUp),$("#prompt_type_default").click(BSC.Editor.EventHandlers.defaultCardPromptClick),$("#prompt-link").click(BSC.Editor.EventHandlers.addPromptClick),$(document).keydown(BSC.Editor.EventHandlers.documentKeyDown),$(document).on("click",".upload-widget [data-action=download]",BSC.Editor.EventHandlers.downloadImageButtonClick),$(document).on("click",".upload-widget [data-action=remove-image]",BSC.Editor.EventHandlers.removeImageButtonClick),$(document).on("click",".upload-widget [data-action=remove-sound]",BSC.Editor.EventHandlers.removeSoundButtonClick),$(document).on("click",".upload-widget [data-action=import-image-from-url]",BSC.Editor.EventHandlers.importImageButtonClick),$(document).on("click",".upload-widget [data-action=close-download-image-form]",BSC.Editor.EventHandlers.closeImportImageFormButtonClick),$("#import-cards").on("click",BSC.Editor.EventHandlers.importButtonClick),$('a[data-action="attach-image-dialog"]').click(BSC.Editor.EventHandlers.attachImageLinkClick),$('a[data-action="attach-sound-dialog"]').click(BSC.Editor.EventHandlers.attachSoundLinkClick),$(".dropupload").on("dropupload-success",BSC.Editor.EventHandlers.dropuploadSuccess),$(".dropupload").on("dropupload-error",BSC.Editor.EventHandlers.dropuploadError)});