

ClassicEditor
	.create( document.querySelector( '#content' ), {
		ckfinder: {
			uploadUrl: '${pageContext.request.contextPath}/admin/goods/ckUpload'
		},
		toolbar: {
			items: [
				'heading',
				'|',
				'fontFamily',
				'fontSize',
				'fontColor',
				'bold',
				'underline',
				'italic',
				'blockQuote',
				'specialCharacters',
				'|',
				'bulletedList',
				'numberedList',
				'indent',
				'outdent',
				'|',
				'insertTable',
				'mediaEmbed',
				'link',
				'imageUpload',
				'undo',
				'redo'
			]
		},
		language: 'ko',
		image: {
			toolbar: [
				'imageTextAlternative',
				'imageStyle:full',
				'imageStyle:side'
			]
		},
		table: {
			contentToolbar: [
				'tableColumn',
				'tableRow',
				'mergeTableCells',
				'tableCellProperties',
				'tableProperties'
			]
		},
		licenseKey: '',
	} )
	.then( editor => {
		window.editor = editor;
	} )
	.catch( error => {
		console.error( 'Oops, something went wrong!' );
		console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
		
		console.error( error );
	} );