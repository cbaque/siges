//
// Copyright 2006 Nelson Daza. nelson.daza@gmail.com. All rights reserved.
// DOM HTML 
// ----------------------------------------------------
//
// Functions.js
//
//	version 2.1.8.4 major.minor[.revision[.build]]
//
	
	/* START Pop-up Windows Script */

	function popup ( url, name, width, height, posx, posy, features )	{
		if ( typeof( posx ) == 'undefined' )
			posx = 'center';
		if ( typeof( posy ) == 'undefined' )
			posy = 'middle';
		if ( typeof( features ) == 'undefined' )
			features = '';

		if ( posx.toLowerCase ( ) == 'center' )
			posx = ( screen.width - width ) / 2;
		else if ( posx.toLowerCase ( ) == 'right' )
			posx = (screen.width - width - 30);
		else if ( posx < 0 )
			posx = screen.width - width + posx;
		else 
			posx = 0;
	
		if ( posy.toLowerCase ( ) == 'middle' )
			posy = ( screen.height - height ) / 2;
		else if ( posy.toLowerCase ( ) == 'bottom' )
			posy = ( screen.height - height - 60 );
		else if ( posy < 0 )
			posx = screen.height - height - posy - 30;
		else 
			posy = 0;
	
		if ( typeof( name ) == 'undefined' || typeof( width ) == 'undefined' || typeof( height ) == 'undefined' )
			return open( url );
		else
			return open( url, name, 'width=' + width + ',height=' + height + ',screenX=' + posx + ',left=' + posx + ',screenY=' + posy + ',top=' + posy + ',' + features );
	}
	
	/* END Pop-up Windows Script */

	function validateEmail ( email )	{
		var pos = 0;
		if ( email.length > 7 && email.indexOf ( ' ', 0 ) == -1 )	{
			pos = email.indexOf ( '@', 0 );
			if ( pos > 2 && email.indexOf ( '@', pos ) && email.indexOf ( '.', pos ) > ( pos + 2 ) )	{
				pos = email.indexOf ( '.', pos );
				if ( pos > -1 && pos < email.length - 2 )
					return true;
			}
		}			
		return false;
	}

	var font_size = 9;
	var MAX = 17;
	var MIN = 11;
	
	function changeFont( num )	{
		font_size += num;
		if( font_size > MAX )
			font_size = MAX;
		if( font_size < MIN )
			font_size = MIN;
		 document.getElementsByTagName( 'body' )[0].style.fontSize = font_size + 'px';
	}

	function toObject ( something )	{
		if ( typeof( something ) == 'string' )
			return document.getElementById ( something );
		if ( typeof( something.nodeName ) != 'undefined' )
			return something;
		return null;
	}
	
	function jumpTo ( url )	{
		document.location.href = url;
	}
	
	function hideElement ( something )	{
		something = toObject ( something );
		if ( something )	{
			something.style.visibility = 'hidden';
			something.style.display = 'none';
		}
	}
	
	function showElement ( something )	{
		something = toObject ( something );
		if ( something )	{
			something.style.visibility = 'visible';
			something.style.display = 'block';
		}
	}
	
	function changeVisibility ( something )	{
		something = toObject ( something );
		if ( something )	{
			if ( something.style.visibility == 'visible' )
				hideElement ( something );
			else
				showElement ( something );
		}
	}
	
	function setElementPosition( something, posx, posy )	{
		something = toObject( something );
		something.style.position = 'absolute';
		something.style.left = posx + 'px';
		something.style.top = posy + 'px';
	}
	
	function isDate ( year, month, day )	{
		if ( year.toString().length == 0 )
			return false;
		if ( day == null )	{
			month = ( month == null ) ? '-' : month;
			if ( year.toString().indexOf( month ) == -1 )
				return false;
			
			var arr = year.toString().split( month );
			if ( arr.length != 3 )
				return false;
			year = arr[0];
			month = arr[1];
			day = arr[2];
		}
		month = month - 1;  // javascript month range : 0- 11
		var tempDate = new Date ( year, month, day );
		var nyear = ( tempDate.getYear ( ) < 1000 ) ? tempDate.getYear ( ) + 1900 : tempDate.getYear ( )
		
		return ( ( nyear == year ) && ( month == tempDate.getMonth ( ) ) && ( day == tempDate.getDate ( ) ) );
	}
	
	function imagenChange ( image, source )	{
		image = toObject ( image );
		if ( image )
			image.src = source;
	}
	
	function checkMaxChars( something, maxChars ){
		something = toObject ( something );
		if ( something && something.value.length > maxChars )
			something.value = something.value.substring( 0, maxChars );
	}
	
	function innerChange ( something, child )	{
		something = toObject ( something );
		if ( something )	{
			while ( something.hasChildNodes( ) )
				something.removeChild( something.firstChild );
			if ( typeof ( text ) == 'string' )
				something.appendChild( document.createTextNode( child ) )
			else
				something.appendChild( child )
		}
	}
	
	function bookMark ( value )	{
		var bookData = new Array ( );
		bookData = value.split ( '|' );
		if ( document.all )
			window.external.AddFavorite ( bookData[0], bookData[1] );
		else
			alert( 'Lo Sentimos, los usuarios de Netscape o Mozilla deben agregar a \nfavoritos manualmente desde el menu o haciendo uso de <Ctrl-D>' );
	}

	function moveElement ( elem, nX, nY, nXStepIn, nYStepIn, bPercent, nInterval, onCallBack )	{
		elem = toObject( elem );
		var style = elem.style;
		var nDirX = 0;
		var nDirY = 0;
		var nXStep = nXStepIn;
		var nYStep = nYStepIn;
		
		if ( nXStep <= 0 )
			nXStep = 1;
	
		if ( nYStep <= 0 )
			nYStep = 1;
			
		var left = Number ( style.left.replace( 'px', '' ) );
		var top = Number ( style.top.replace( 'px', '' ) );
		
		if ( Math.abs( nX - left ) > 0 )	{
			if ( bPercent )
				nXStep = Math.ceil ( ( nXStepIn ) * Math.abs ( nX - left ) / 100 );
			
			if ( Math.abs( nX - left ) < Math.abs( nXStep ) + 1 )
				nXStep = Math.abs( nX - left );
			
			nDirX = ( nX - left ) >= 0 ? 1 : -1;
			
			left += nXStep * nDirX;
			style.left = left + 'px';
		}

		if ( Math.abs( nY - top ) > 0 )	{
			if ( bPercent )
				nYStep = Math.ceil ( ( nYStep ) * Math.abs( nY - top ) / 100 );

			if ( Math.abs( nY - top ) < Math.abs( nYStep ) + 1 )
				nYStep = Math.abs( nY - top );
			
			nDirY = ( nY - top ) >= 0 ? 1 : -1;
			
			top += nYStep * nDirY;
			style.top = top + 'px';
		}
		
		if ( nDirX == 0 && nDirY == 0 )	{
			if ( onCallBack != undefined )	{
				var func = new Function( onCallBack );
				func( );
			}
		}
		else
			elem.timeout = setTimeout( "moveElement ( '" + elem.id + "', " + nX + ", " + nY + ", " + nXStepIn + ", " + nYStepIn + ", " + bPercent + ", " + nInterval + ", \"" + onCallBack + "\" )", nInterval );
	}

	/* START SortTable Script */

	function compare ( obj1, obj2 )	{
		var str1 = obj1.toString( ).toLowerCase( );
		var str2 = obj2.toString( ).toLowerCase( );
		if ( str1 == str2 )
			return 0;
		if ( isNaN ( str1 ) && isNaN ( str2 ) )	{
			return ( str1 > str2 ) ? 1 : -1;
		}
		
		return Number( str1 ) - Number ( str2 );
	}

	function sortTable ( column )	{
		column = toObject ( column );
		if ( column )	{
			var table = column;
			while ( table && table.parentNode && table.parentNode.nodeName.toLowerCase( ) != 'table' )
				table = table.parentNode;
			if ( table )	{
				var groups = table.getElementsByTagName ( 'tbody' );
				alert( groups.length )
				for( var c = 0; c < groups.length; c++ )
					sortTableRows ( groups[c], column.parentNode.cellIndex );
			}
		}
	}
	
	function sortTableRows ( group, col )	{
		var oRows = new Array ( );	//set the rows to be removed as an array of cloneNodes
		var iRows = new Array ( );	//set those rows' indexes as array

		for ( var c = 0; c < group.rows.length; c++ )	{
			oRows[c] = group.rows[c].cloneNode ( true );
			iRows[c] = group.rows[c].sectionRowIndex;
		}
		var oCol = new Array ( );			//set the string content of column cells as array
		var vCol = new Array ( );			//set the "compare" array for a future sort/reverse

		for ( c = 0; c < iRows.length; c++ )	{
			if ( group.rows[c].cells[col] )
				vCol[c] = oCol[c] = [group.rows[c].cells[col].firstChild.nodeValue,iRows[c]];
			else
				vCol[c] = oCol[c] = ['',iRows[c]];
		}

		oCol.sort ( compare );	//sorts the content array

		if ( vCol.toString ( ) == oCol.toString ( ) )
			oCol.reverse ( );	//if the content was already sorted, reverse

		for ( c = 0; c < group.rows.length; c++ )	{
			group.replaceChild ( oRows[oCol[c][1]], group.rows[c] );	//writes the rows in a sorted/reversed order
		}
	}

	/* END SortTable Script */

	/**********************************/
	/* BEGIN General Functions Script */
	/**********************************/
	
	function MM_swapImgRestore ( ) {	//v3.0
		var i, x, a = document.MM_sr;
		for ( i = 0; a && i < a.length && ( x = a[i] ) && x.oSrc; i++ )
			x.src = x.oSrc;
	}
	
	function MM_preloadImages ( ) {	//v3.0
		var d = document;
		if ( d.images )	{
			if ( !d.MM_p )
				d.MM_p = new Array();
			var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
			for ( i = 0; i < a.length; i++ )
				if ( a[i].indexOf("#") != 0 )	{
					d.MM_p[j] = new Image;
					d.MM_p[j++].src = a[i];
				}
		}
	}
	
	function MM_findObj ( n, d )	{	//v4.01
		var p, i, x;
		if ( !d )
			d = document;
		if ( ( p = n.indexOf("?") ) > 0 && parent.frames.length )	{
			d = parent.frames[n.substring( p + 1 )].document;
			n = n.substring( 0, p );
		}
		if ( !( x = d[n] ) && d.all )
			x = d.all[n];
			for ( i = 0; !x && i < d.forms.length; i++ )
				x = d.forms[i][n];
		for( i = 0; !x && d.layers && i < d.layers.length; i++ )
			x = MM_findObj( n,d.layers[i].document );
		if( !x && d.getElementById )
			x = d.getElementById(n);
		
		return x;
	}
	
	function MM_swapImage ( )	{	//v3.0
		var i, j = 0, x, a = MM_swapImage.arguments;
		document.MM_sr = new Array;
		for( i = 0; i < ( a.length - 2 ); i += 3 )
			if ( ( x = MM_findObj( a[i] ) ) != null )	{
				document.MM_sr[j++] = x;
			if( !x.oSrc )
				x.oSrc = x.src;
			x.src = a[i+2];
		}
	}
	
	function MM_jumpMenu ( targ, selObj, restore )	{	//v3.0
		eval ( targ + ".location='" + selObj.options[selObj.selectedIndex].value + "'" );
		if ( restore )
			selObj.selectedIndex = 0;
	}
	
	function MM_nbGroup ( event, grpName ) { //v6.0
		var i, img, nbArr, args = MM_nbGroup.arguments;
		if ( event == "init" && args.length > 2 ) {
			if ( ( img = MM_findObj ( args[2] ) ) != null && !img.MM_init ) {
				img.MM_init = true;
				img.MM_up = args[3];
				img.MM_dn = img.src;
				if ( ( nbArr = document[grpName] ) == null ) nbArr = document[grpName] = new Array ( );
					nbArr[nbArr.length] = img;
				for ( i = 4; i < args.length - 1; i += 2 )
					if ( ( img = MM_findObj ( args[i] ) ) != null ) {
						if ( !img.MM_up )
							img.MM_up = img.src;
						img.src = img.MM_dn = args[i + 1];
						nbArr[nbArr.length] = img;
					}
				}
			} else if ( event == "over" ) {
				document.MM_nbOver = nbArr = new Array ( );
				for ( i = 1; i < args.length - 1; i += 3 )
					if ( ( img = MM_findObj ( args[i] ) ) != null ) {
						if ( !img.MM_up )
							img.MM_up = img.src;
						img.src = ( img.MM_dn && args[i + 2] ) ? args[i + 2] : ( ( args[i + 1] )? args[i + 1] : img.MM_up );
						nbArr[nbArr.length] = img;
					}
			} else if ( event == "out" ) {
				for ( i = 0; i < document.MM_nbOver.length; i++ ) {
					img = document.MM_nbOver[i];
					img.src = ( img.MM_dn ) ? img.MM_dn : img.MM_up;
				}
			} else if ( event == "down" ) {
				nbArr = document[grpName];
				if ( nbArr )
					for ( i = 0; i < nbArr.length; i++ ) {
						img = nbArr[i];
						img.src = img.MM_up;
						img.MM_dn = 0;
					}
				document[grpName] = nbArr = new Array ( );
				for ( i = 2; i < args.length - 1; i += 2 )
					if ( ( img = MM_findObj ( args[i] ) ) != null ) {
						if ( !img.MM_up )
							img.MM_up = img.src;
						img.src = img.MM_dn = ( args[i + 1] )? args[i + 1] : img.MM_up;
						nbArr[nbArr.length] = img;
					}
			}
	}
	
