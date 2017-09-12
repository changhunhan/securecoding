<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mindmapEdit.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/go.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script>
	var myDiagram;
	var myModel;
	var tempOri=new Array();
	var fileArray= new Array();
	var mind_num;
	var count=0;

	$(document).ready(function() {
		var $ = go.GraphObject.make;
		if(count==0){
			mind_num=parseInt(document.getElementById("mind_num").value);
			count++;
		}
		
		myDiagram = $(go.Diagram, "dd",
		{
		      initialContentAlignment: go.Spot.Center,
		      "undoManager.isEnabled": true,
		      "commandHandler.deletesTree" : true,
		      "clickCreatingTool.isDoubleClick":true,
		      layout:
	              $(FlatTreeLayout,  // custom Layout, defined below
	                { angle: 90,
	                  compaction: go.TreeLayout.CompactionNone })
		});	

		myDiagram.nodeTemplate = $(go.Node, "Auto", {
			selectionObjectName : "TEXT"
		},
		{doubleClick:nodeDoubleClick}, 
		$(go.Shape,"Ellipse",{
			width:120,
			height:120,
			fill:"#7fcbe1",
			stroke:"#f3faff",
			strokeWidth:4
		},
			new go.Binding("fill","color"),
			new go.Binding("width","넓이"),
			new go.Binding("height", "높이")),
			
		$(go.TextBlock, "Default Text" ,
		{
			name : "TEXT",
			stroke : "white",
			minSize : new go.Size(20, 15),
			isMultiline: false,
			editable : true
		},
		new go.Binding("text", "text").makeTwoWay())
		
		);
		
		myDiagram.nodeTemplate.selectionAdornmentTemplate = $(go.Adornment,"Spot", 
				$(go.Panel, "Auto",
				// 노드 클릭시 텍스트 테두리 사이즈 조절
					$(go.Shape, {
						fill : null,
						stroke : "dodgerblue",
						strokeWidth : 3
					}), 
					$(go.Placeholder, {
						margin : new go.Margin(4, 4, 0, 4)
					})
				)
		);
		myDiagram.nodeTemplate.contextMenu = $(go.Adornment, "Vertical",
				$("Button", {
					click : mindmapCont
				}, $(go.TextBlock, "내용",{
					font : "bold 10pt sans-serif"
				})),
				$("Button", {
					click : mindmapDelete
				}, $(go.TextBlock, "삭제",{
					font : "bold 10pt sans-serif"
				}))
				
				);
		myDiagram.linkTemplate =
		      $(go.Link, go.Link.Orthogonal,{ 
		    	  corner: 5, 
		    	  relinkableFrom: true, 
		          relinkableTo: true 
		       },
		        $(go.Shape, { strokeWidth: 4, stroke: "#8ecaf5" })
				)
		
				
		load();
				
	});
	
	function nodeDoubleClick(e, obj) {
	      var clicked = obj.part;
	      if (clicked != null) {
	    	var diagram = clicked.diagram;
			var olddata = clicked.data;
	  	  
			if(olddata.type=='boss'){
	        var newemp = { 
	        		text : "커리큘럼",
					color : "#f0b1ac",
					parent: olddata.key,
					number: mind_num++,
					type : "big" 
			};
	        
	        myDiagram.model.addNodeData(newemp);
	      }
			else if(olddata.type=='강의'){
				var newemp = { 
						text : "중",
						color : "#e0b1cb",
						높이 : 80,
						넓이 : 80,
						parent: olddata.key,
						number: mind_num++,
						type : "middle"
				};
		        myDiagram.model.addNodeData(newemp);
			}
			else if(olddata.type=='middle'){
				var newemp = { 
						text : "첨부",
						color : "#c2dc9f",
						높이 : 60,
						넓이 : 60,
						parent: olddata.key,
						number:mind_num++,
						type : "small" 
				};
		        myDiagram.model.addNodeData(newemp);
			}
	      }
	}
	
	function FlatTreeLayout() {
	    go.TreeLayout.call(this);  // call base constructor
	  }
	  go.Diagram.inherit(FlatTreeLayout, go.TreeLayout);
	
	function mindmapCont(e,obj){
		var adorn = obj.part;
		var oldnode = adorn.adornedPart;
		var olddata = oldnode.data;
		var p=olddata.parent;
		var n=olddata.number;
		var type=olddata.type;
		
		//내용+첨부파일
		if(type=='small'){
		document.getElementById("midm_ori_num").value = n;
		document.getElementById("midm_perent_num").value = p;
		var midm_ori_num=n;
		var midm_perent_num=p;
		var midm_key_num=document.getElementById("key").value;
		var value={midm_ori_num : midm_ori_num, midm_key_num : midm_key_num, midm_perent_num : midm_perent_num};
		$.ajax({
	    	url : "${pageContext.request.contextPath}/mindmap/selectBy",
	    	type :'POST',
	    	data : value,
	    	success : function(res) {

	    		if(res[0]!=null){
	    			
	    		 document.getElementById("mindmap_cont").value=res[0].midm_cont;
	    		 document.getElementById("midm_num").value=res[0].midm_num;
	    		 title=res[1].midm_file_name;
	    		 size=res[1].midm_file_size;
	    		 num=res[0].midm_num;
	    		 
	    		 var fileInfo =  title;
				 fileInfo += "<span class=\"mailbox-attachment-size\">"
							+ size + " </span>";
	    		 var name=(res[1].midm_file_name).substr((res[1].midm_file_name).length-3);
	    	
	    		 if(document.getElementById("fileapp")!=null){
	 				document.getElementById("fileapp").remove();
	 			}
	    		 if (name == "jpg" || name == "png") {
	 					$("#file-list").append("<li id=\"fileapp\" style='float: left; width: 100px; border: 1px solid #eee; margin-bottom: 10px; margin-right: 10px;' ><span class=\"mailbox-attachment-icon\"><i class=\"fa fa-file-image-o\"></i></span><div class=\"mailbox-attachment-info\">"
	 											+ fileInfo
	 											+ "</div><input type=\"button\" class=\"btn btn-block btn-danger btn-sm\" value=\"삭제\" onclick=\"filedel(this,"+num+");\"></li>");
					} else if (name == "pdf") {
						$("#file-list")
								.append(
										"<li id=\"fileapp\" style='float: left; width: 200px; border: 1px solid #eee; margin-bottom: 10px; margin-right: 10px;' ><span class=\"mailbox-attachment-icon\"><i class=\"fa fa-file-pdf-o\"></i></span><div class=\"mailbox-attachment-info\">"
												+ fileInfo
												+ "</div><input type=\"button\" class=\"btn btn-block btn-danger btn-sm\" value=\"삭제\" onclick=\"filedel(this,"+num+");\"></li>");
					} else if (name == "hwp") {
						$("#file-list")
								.append(
										"<li id=\"fileapp\" style='float: left; width: 200px; margin-bottom: 10px; margin-right: 10px;' ><span class=\"mailbox-attachment-icon\"><i class=\"fa fa-file-word-o\"></i></span><div class=\"mailbox-attachment-info\">"
												+ fileInfo
												+ "</div><input type=\"button\" class=\"btn btn-block btn-danger btn-sm\" value=\"삭제\" onclick=\"filedel(this,"+num+");\"></li>");
					} else if (name == "lsx" || name == "xls") {
						$("#file-list")
								.append(
										"<li id=\"fileapp\" style='float: left; width: 200px; border: 1px solid #eee; margin-bottom: 10px; margin-right: 10px;' ><span class=\"mailbox-attachment-icon\"><i class=\"fa fa-file-excel-o\"></i></span><div class=\"mailbox-attachment-info\">"
												+ fileInfo
												+ "</div><input type=\"button\" class=\"btn btn-block btn-danger btn-sm\" value=\"삭제\" onclick=\"filedel(this,"+num+");\"></li>");
					} else {
						$("#file-list")
								.append(
										"<li id=\"fileapp\" style='float: left; width: 200px; border: 1px solid #eee; margin-bottom: 10px; margin-right: 10px;' ><span class=\"mailbox-attachment-icon\"><i class=\"fa fa-file\"></i></span><div class=\"mailbox-attachment-info\">"
												+ fileInfo
												+ "</div><input type=\"button\" class=\"btn btn-block btn-danger btn-sm\" value=\"삭제\" onclick=\"filedel(this,"+num+");\"></li>");
					}
	    		}
	    		else if(res[0]==null){
	    			
	    			if(document.getElementById("fileapp")!=null){
		 				document.getElementById("fileapp").remove();
		 			}
	    			
		    		document.getElementById("mindmap_cont").value=null;
		    		document.getElementById("fileSubName").value=null;
	    		} 
			},
			dataType : 'json'
	    }) 
	    $("#searchModalEdit").click();
		}
		
		//내용
		else if(type=='middle' || type=='big'){
			document.getElementById("midm_ori_num").value = n;
			document.getElementById("midm_perent_num").value = p;
			var midm_ori_num=n;
			var midm_perent_num=p;
			var midm_key_num=document.getElementById("key").value;
			
			var value={midm_ori_num : midm_ori_num, midm_key_num : midm_key_num, midm_perent_num : midm_perent_num};
			$.ajax({
		    	url : "${pageContext.request.contextPath}/mindmap/selectBy",
		    	type :'POST',
		    	data : value,
		    	success : function(res) {
					
		    		  if(res[0]!=null){
		    		 	
		    		 	document.getElementById("mindmapcont_cont").value=res[0].midm_cont;
		    		 	document.getElementById("midm_num").value=res[0].midm_num;
		    		}
		    		else if(res[0]==null){
		    			
			    		document.getElementById("mindmapcont_cont").value=null;
		    		} 
				},
				dataType : 'json'
		    }) 
		    $("#searchModalContent").click();
		}
	}
	
	function filedel(obj,num){	
		
		var midm_img_num = num;
		var li = $(obj).parent();
		fileArray.push(midm_img_num);
		$(li).remove();			
	}
	
	function mindmapDelete(e,obj){
		e.diagram.commandHandler.deleteSelection();
		var adorn = obj.part;
		var oldnode = adorn.adornedPart;
		var olddata = oldnode.data;
		var midm_ori_num=olddata.number;
		tempOri.push(midm_ori_num);
	}
		
	function changeTextSize(obj, factor) {
		var adorn = obj.part;
		adorn.diagram.startTransaction("Change Text Size");
		var node = adorn.adornedPart;
		var tb = node.findObject("TEXT");
		tb.scale *= factor;
		adorn.diagram.commitTransaction("Change Text Size");
	}
	
	function save() {
	    document.getElementById("mySavedModel").value = myDiagram.model.toJson();
	   
	    var formData = new FormData();
	    var formData2 =new FormData();
	    myDiagram.isModified = false;
	    var text=document.getElementById("mySavedModel").value;
	    var key=document.getElementById("key").value;
	    formData2.append("text",text);
	    formData2.append("key",key);
	   
	    
	    formData.append("tempOri",tempOri);
	    formData.append("tempKey",key);
	    
	    $.ajax({
	    	url : "${pageContext.request.contextPath}/mindmap/mindmapDelete",
	    	type :'POST',
	    	data : formData,
	    	async: false,
			cache: false,
			contentType: false,
			processData: false,
	    	success : function(res) {
	    	},
	    	dataType:'json'
		})

	     $.ajax({
	    	url : "${pageContext.request.contextPath}/mindmap/mindmapUpdate",
	    	type :'POST',
	    	data : formData2,
	    	async: false,
			cache: false,
			contentType: false,
			processData: false,
	    	success : function(res) {
	    		location.href="${pageContext.request.contextPath}/video/curriculum/curriculumList";
			}
	    }) 
	  }
	function load() {
		var image=new Image();
		myDiagram.model = go.Model.fromJson(document.getElementById("mySavedModel").value);	
		
		image.src=document.getElementById("path").value;
		document.getElementById("aa").appendChild(image);
	}		
	var fileList = new Map();
	var count = 0;
		
	function traverseFiles(files) {
			var li, file, fileInfo;
			if(document.getElementById("fileapp")!=null){
				document.getElementById("fileapp").remove();
			}
			for (var i = 0; i < files.length; i++) {
				var li = "";
				file = files[i];
				fileInfo =  file.name;
				fileInfo += "<span class=\"mailbox-attachment-size\">"
						+ file.size + " </span>";

				fileList.set(count, files[i]);
				var name = (file.name).substr((file.name).length - 3);
				if (name == "jpg" || name == "png" || files=="jpg" || files=="png") {
 					$("#file-list").append("<li id=\"fileapp\" style='float: left; width: 100px; border: 1px solid #eee; margin-bottom: 10px; margin-right: 10px;' ><span class=\"mailbox-attachment-icon\"><i class=\"fa fa-file-image-o\"></i></span><div class=\"mailbox-attachment-info\">"
 											+ fileInfo
 											+ "</div><input type=\"button\" class=\"btn btn-block btn-danger btn-sm\" value=\"삭제\" onclick=\"del(this,"+ count + ");\"></li>");
				} else if (name == 'pdf') {
					$("#file-list")
							.append(
									"<li id=\"fileapp\" style='float: left; width: 200px; border: 1px solid #eee; margin-bottom: 10px; margin-right: 10px;' ><span class=\"mailbox-attachment-icon\"><i class=\"fa fa-file-pdf-o\"></i></span><div class=\"mailbox-attachment-info\">"
											+ fileInfo
											+ "</div><input type=\"button\" class=\"btn btn-block btn-danger btn-sm\" value=\"삭제\" onclick=\"del(this,"+ count + ");\"></li>");
				} else if (name == 'hwp') {
					$("#file-list")
							.append(
									"<li id=\"fileapp\" style='float: left; width: 200px; margin-bottom: 10px; margin-right: 10px;' ><span class=\"mailbox-attachment-icon\"><i class=\"fa fa-file-word-o\"></i></span><div class=\"mailbox-attachment-info\">"
											+ fileInfo
											+ "</div><input type=\"button\" class=\"btn btn-block btn-danger btn-sm\" value=\"삭제\" onclick=\"del(this,"	+ count + ");\"></li>");
				} else if (name == 'lsx' || name == 'xls') {
					$("#file-list")
							.append(
									"<li id=\"fileapp\" style='float: left; width: 200px; border: 1px solid #eee; margin-bottom: 10px; margin-right: 10px;' ><span class=\"mailbox-attachment-icon\"><i class=\"fa fa-file-excel-o\"></i></span><div class=\"mailbox-attachment-info\">"
											+ fileInfo
											+ "</div><input type=\"button\" class=\"btn btn-block btn-danger btn-sm\" value=\"삭제\" onclick=\"del(this,"+ count + ");\"></li>");
				} else {
					$("#file-list")
							.append(
									"<li id=\"fileapp\" style='float: left; width: 200px; border: 1px solid #eee; margin-bottom: 10px; margin-right: 10px;' ><span class=\"mailbox-attachment-icon\"><i class=\"fa fa-file\"></i></span><div class=\"mailbox-attachment-info\">"
											+ fileInfo
											+ "</div><input type=\"button\" class=\"btn btn-block btn-danger btn-sm\" value=\"삭제\" onclick=\"del(this,"+ count + ");\"></li>");
				}
			}
		};
		$(document).on("change","#uploadFiles", function() {
			if(document.getElementById("fileapp")!=null){
				alert("이미 파일이 존재합니다.");
			}
			else{
				traverseFiles(this.files);
			}
		});		
		$(document).on("click", "#fileUploadClick", function() {
			var formData = new FormData();
			formData.append("midm_key_num",$("#key").val());
			formData.append("midm_num",$("#midm_num").val());
			formData.append("midm_perent_num",$("#midm_perent_num").val());
			formData.append("midm_ori_num",$("#midm_ori_num").val());
			formData.append("midm_cont", $("#mindmap_cont").val());
			
			var mapIter = fileList.values();
			for(var i = 0; i < fileList.size; i++) {
				formData.append("uploadFiles", mapIter.next().value);
			}
			formData.append("tempFile",fileArray);
			
			
			$.ajax({
				url : "${pageContext.request.contextPath}/mindmap/cirInsert",
				type: "POST",
				data : formData,
				async: false,
				cache: false,
				contentType: false,
				processData: false,
				success : function(res) {				
				} 
			})
			$("#fileClose").click();
			document.getElementById("fileUpload").reset();
			document.getElementById("fileapp").remove();
			
		});
		function del(a, b) {
			fileList.delete(b);
			$(a).parent().remove();
		}	
	</script>
</head>
<body>
	<div class="wrapper">
		<div class="content-wrapper" id="conWBground">
		<br>
		<section class="content-header">
			<h1 id="title">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;동영상 업로드<small>마인드맵 수정</small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-dashboard"></i> 마이페이지</li>
				<li class="active">강의관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ol>
		</section>
		<hr id="hr"></hr>
		<br><br>
		<!-- /.헤더 -->
		
		<section class="content">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<div class="box box-primary" style="padding: 1%;">
					<br>
					<center><div id="dd" style="width: 1000px; height: 600px; background-color: #f3faff;"></div></center>
					<br>
					<center><button id="SaveButton" onclick="save()" class="btn btn-primary" style="width:200px;">Save</button></center>
					<div id="inputEventsMsg"></div>
					<textarea id="mySavedModel" style="width: 100%; height: 400px" hidden>${vo.text}</textarea>
					<input type="text" id="key" name="key" value="${vo.key}" hidden> 
					<input type="text" id="mind_num" name="mind_num" value="${vo.mind_num}" hidden>
					<input type="text" id="path" name="path" value="${vo.path}" hidden>
					
					<a href="#" data-toggle="modal" data-target="#signUpModalEdit" id="searchModalEdit"></a>
					
					<a href="#" data-toggle="modal" data-target="#contentModalEdit" id="searchModalContent"></a>
					
					<input type="text" id="midm_num" name="midm_num" hidden>

					<div class="modal fade" id="contentModalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content modal-popup">
								<%@include
									file="/WEB-INF/views/mypage/mpTeacher/tVideo/curriculum/mindmapFormEdit.jsp"%>
							</div>
						</div>
					</div>
					<div class="modal fade" id="signUpModalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content modal-popup">
								<%@include
									file="/WEB-INF/views/mypage/mpTeacher/tVideo/curriculum/mindmapFileForm.jsp"%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>
		</div>
	</div>
		
</body>
</html>