// Overridden with the Brainscape configuration.
CKEDITOR.editorConfig = function( config )
{
  config.toolbar_Full =
  [
    ['Bold','Italic','Underline','Subscript','Superscript'],
    ['FontSize'],
    ['SpecialChar','Link','Unlink'],['RemoveFormat','PasteFromWord'],
    ['NumberedList','BulletedList','Outdent','Indent','JustifyLeft','JustifyCenter','JustifyRight'],
    ['Source']
  ];
  config.toolbar_Prompt =
  [
    ['Bold','Italic','Underline','Subscript','Superscript','JustifyLeft','JustifyCenter','JustifyRight','RemoveFormat','SpecialChar']
  ];
  config.toolbar_Category =
  [
    ['Bold','Italic','Underline','RemoveFormat','SpecialChar'],
    ['-','JustifyLeft','JustifyCenter','JustifyRight',],
    ['NumberedList','BulletedList','Outdent','Indent',],
    ['Link','Unlink','-','Source']
  ];
  config.toolbar_CMS =
  [
    ['Save','NewPage','Preview','-','Templates'],
    ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],
    ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
    ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
    '/',
    ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
    ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
    ['Link','Unlink','Anchor'],
    ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
    '/',
    ['Styles','Format','Font','FontSize'],
    ['TextColor','BGColor'],
    ['Maximize', 'ShowBlocks','-','About']
  ];

  config.fontSize_sizes = 'Small/small;Medium/medium;Large/large;';
  config.enterMode = CKEDITOR.ENTER_P;
  config.forcePasteAsPlainText = true;
  config.resize_enabled = false;
  config.fontSize_defaultLabel = "Medium";
  config.allowedContent = true;

  config.contentsCss = '/assets/application.css';

  config.fontSize_style =
  {
      element           : 'span',
      attributes        : {'class' : '#(size)'},
      overrides : [ { element : 'font', attributes : { 'class' : null } } ]
  };

  config.specialChars =
  [
    '!','"','#','$','%','&',"'",'(',')','*','+','-','.','/',
    '0','1','2','3','4','5','6','7','8','9',':',';',
    '<','=','>','?','@',
    'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O',
    'P','Q','R','S','T','U','V','W','X','Y','Z',
    '[',']','^','_','`',
    'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p',
    'q','r','s','t','u','v','w','x','y','z',
    '{','|','}','~',
    "€", "‘", "’", "“", "”", "–", "—", "¡", "¢", "£", "¤", "¥", "¦", "§", "¨", "©", "ª", "«", "¬", "®", "¯", "°", "²", "³", "´", "µ", "¶", "·", "¸", "¹", "º", "»", "¼", "½", "¾", "¿", "À", "Á", "Â", "Ã", "Ä", "Å", "Æ", "Ç", "È", "É", "Ê", "Ë", "Ì", "Í", "Î", "Ï", "Ð", "Ñ", "Ò", "Ó", "Ô", "Õ", "Ö", "×", "Ø", "Ù", "Ú", "Û", "Ü", "Ý", "Þ", "ß", "à", "á", "â", "ã", "ä", "å", "æ", "ç", "è", "é", "ê", "ë", "ì", "í", "î", "ï", "ð", "ñ", "ò", "ó", "ô", "õ", "ö", "÷", "ø", "ù", "ú", "û", "ü", "ý", "þ", "ÿ", "Œ", "œ", "Ŵ", "Ŷ", "ŵ", "ŷ", "‚", "‛", "„", "…", "™", "►", "•", "→", "⇒", "⇔", "♦", "≈",
    "Π", "π", "Σ", "ς", "σ"
  ];
};
