CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
    config.width = 750;
    config.height = 450;
    config.filebrowserBrowseUrl = '/ckfinder/ckfinder.html';
    config.filebrowserImageBrowseUrl = '/ckfinder/ckfinder.html?Type=Images';
    config.filebrowserFlashBrowseUrl = '/ckfinder/ckfinder.html?Type=Flash';

    config.filebrowserUploadUrl = '/base/ckeditorUpload.do?type=Files';
    config.filebrowserImageUploadUrl = '/base/ckeditorUpload.do?type=Images';
    config.filebrowserFlashUploadUrl = '/base/ckeditorUpload.do?type=Flash';

};
