<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "./inc/header.jsp" %>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
		<%@ include file="./inc/sidebar.jsp" %>     
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
               <%@ include file ="./inc/topbar.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            	
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>이름</th>
                                            <th>사이즈</th>
                                            <th>낮사진</th>
                                            <th>밤사진</th>
                                            <th>등록날짜</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>No</th>
                                            <th>이름</th>
                                            <th>사이즈</th>
                                            <th>낮사진</th>
                                            <th>밤사진</th>
                                            <th>등록날짜</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                       
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
	<div id="fu"></div>
    <!-- Bootstrap core JavaScript-->
    <script src="${path }/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${path }/resources/vendor/bootstrap/js/bootstrap.bundle.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${path }/resources/vendor/jquery-easing/jquery.easing.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${path }/resources/js/sb-admin-2.js"></script>

    <!-- Page level plugins -->
    <script src="${path }/resources/vendor/datatables/jquery.dataTables.js"></script>
    <script src="${path }/resources/vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Page level custom scripts -->
    <script src="${path }/resources/js/demo/datatables-demo.js"></script>

	<script>
	
		let userId = sessionStorage.getItem("id");
		let session = '${isme}';
    
	   $(document).ready(function(){
	      
	      $.ajax({
	         url : apiurl + "item/listAll",
	         type : 'get',
	         dataType : 'json',
	         success : function(data) {
	            let html = "";
	            
	            for(i=0; i< data.length; i++) {
	               
	               html += "<tr>";
	               html += "<td>"+data[i].item_no+"</td>";
	               html += "<td>"+data[i].item_nm+"</td>";
	               html += "<td>"+data[i].item_size+"</td>";
	               
	               //낮사진
	               if(data[i].item_img_aft && data[i].item_img_aft != '') {
	               	html += " <td><img src='"+data[i].item_img_aft+"' style='width:30%'>";
	               	html += "<input type='file' accept='image/*' id='itemAft_"+data[i].item_no+"' name='itemAft_"+data[i].item_no+"'><br>";
	               	html += "<a href='javascript:void(0);' class='btn btn-success btn-circle' id='Aftsubmit' onclick='fsubmit(this)' data-itemno= '"+data[i].item_no+"'><i class='fas fa-check'></i></a></td>";
	            	
	               } else {
	            	html += " <td>";
	            	html += "<input type='file' accept='image/*' id='itemAft_"+data[i].item_no+"' name='itemAft_"+data[i].item_no+"'><br>";
	            	html += "<a href='javascript:void(0);' class='btn btn-success btn-circle' id='Aftsubmit' onclick='fsubmit(this)' data-itemno= '"+data[i].item_no+"'><i class='fas fa-check'></i></a>";
	            	html += "<input type='hidden' id='item_no' name='item_no' value='"+data[i].item_no+"'></td>";
	               }
	               
	               //밤사진
	               if(data[i].item_img_nig && data[i].item_img_nig != '') {
	               	html += "<td><img src='"+data[i].item_img_nig+"' style='width:30%'>";
	               	html += "<input type='file' accept='image/*' id='itemNig_"+data[i].item_no+"' name='itemNig_"+data[i].item_no+"'>";
	            	html += "<a href='javascript:void(0);' class='btn btn-success btn-circle' id='Nigsubmit' onclick='fsubmit(this)' data-itemno= '"+data[i].item_no+"'><i class='fas fa-check'></i></a></td>";	            	
	            	
	               } else {
            	    html += " <td>";
	            	html += "<input type='file' accept='image/*' id='itemNig_"+data[i].item_no+"' name='itemNig_"+data[i].item_no+"'>";
	            	html += "<a href='javascript:void(0);' class='btn btn-success btn-circle' id='Nigsubmit' onclick='fsubmit(this)' data-itemno= '"+data[i].item_no+"'><i class='fas fa-check'></i></a>";	            	
	            	html += "<input type='hidden' id='item_no' name='item_no' value='"+data[i].item_no+"'></td>";
		           }
	               
	               html += "<td>";
	               html += "</td></tr>";
	            
	            }
	            $("#dataTable").append("");
	            $("#dataTable").append(html);
	         },
	         fail : function(error) {
	            // 실패 시 실행할 코드
	            alert("API 통신에 실패하였습니다. \n관리자에게 문의 바랍니다.");
	            console.log('AJAX 요청 실패:' + "code:" + request.status
	                  + "\n" + "message:" + request.responseText);
	         }
	      })
	      
	   })
  	
    function compressImage(imageFile, quality) {
	    return new Promise((resolve, reject) => {
	        const reader = new FileReader();
	        reader.readAsDataURL(imageFile);
	
	        reader.onload = (event) => {
	            const img = new Image();
	            img.src = event.target.result;
	
	            img.onload = () => {
	                const canvas = document.createElement('canvas');
	                const ctx = canvas.getContext('2d');
	                canvas.width = img.width;
	                canvas.height = img.height;
	
	                ctx.drawImage(img, 0, 0, img.width, img.height);
	
	                // canvas를 Blob으로 변환하고 특정 품질로 압축
	                canvas.toBlob((blob) => {
	                    const compressedFile = new File([blob], imageFile.name, {
	                        type: 'image/jpeg', // 이미지 타입에 따라 수정 가능
	                        lastModified: Date.now(),
	                    });
	
	                    resolve(compressedFile);
	                }, 'image/jpeg', quality); // 이미지 타입에 따라 수정 가능
	            };
	
	            img.onerror = (error) => {
	                reject(error);
	            };
	        };
	
	        reader.onerror = (error) => {
	            reject(error);
	        };
	    });
	}
	 //이미지 파일 검사 
	 async function fsubmit(id) {
		   let imgId = $(id).attr('id');
		   let itemNo = id.getAttribute('data-itemno');
		   let AftimgfileElement = document.getElementById('itemAft_'+itemNo);
		   let NigimgfileElement = document.getElementById('itemNig_'+itemNo);

		   if (imgId == 'Aftsubmit') {
		       let Aftimgfile = AftimgfileElement && AftimgfileElement.files.length > 0 ? AftimgfileElement.files[0] : null;

		       if (Aftimgfile) {
		    	   Aftimgfile = await compressImage(Aftimgfile, 0.5); // 0.5는 이미지 품질을 나타냅니다. 필요에 따라 조절하세요.
	
		           submitForm(Aftimgfile, '', itemNo, imgId);
		       } else {
		           alert("낮 사진을 첨부해주세요");
		           return false;
		       }
		   } else if (imgId == 'Nigsubmit') {
		       let Nigimgfile = NigimgfileElement && NigimgfileElement.files.length > 0 ? NigimgfileElement.files[0] : null;

		       if (Nigimgfile) {
		           submitForm('', Nigimgfile, itemNo, imgId);
		       } else {
		           alert("밤 사진을 첨부해주세요");
		           return false;
		       }
		   }
	}
	   
  
	   
	//S3에 이미지 업로드 
	function submitForm(Aftimgfile, Nigimgfile, itemNo, imgId) {
		
		if(userId == session) {
		
			var formData = new FormData();  // 새로운 FormData 객체 생성
	
		    	formData.append('itemAft', Aftimgfile);  // 낮이미지
		   		formData.append('itemNig', Nigimgfile); //밤
		    	formData.append('item_no', itemNo);  // 파일 데이터 추가
			 
		   // console.log("Aftimgfile"+Aftimgfile, "Nigimgfile:"+ Nigimgfile, itemNo);
		    	
		     $.ajax({
		        url: apiurl+'img/upload',  
		        type: 'POST',
		        data: formData,
		        contentType: false,
		        processData: false,
		        success: function (data) {
		            // 서버로부터의 응답 처리
		            console.log(data);
		            imgUrlSavetoDB(data.filename, itemNo, imgId);
		        },
		        error: function (error) {
		            console.error('Error:', error);
		        }
		    }); 
		} else {
			alert("관리자로그인 후 등록해 주세요");
		}
	}
	
	//이미지 Url DB에 update
	function imgUrlSavetoDB(filename, itemNo, imgId) {
		let bucketName = 'farmfindimg';
		
		let replacedFileName = replaceSpacesInFileName(filename);
		
		let imgUrl = "https://"+bucketName+".s3.ap-northeast-2.amazonaws.com/"+replacedFileName;
		
		console.log(imgUrl, itemNo);
		
		  if(filename) {
		
			$.ajax({
				url : apiurl+'img/url',
				type : 'GET',
				data : { imgUrl : imgUrl,
						item_no : itemNo,
						imgId : imgId
				},				
				success : function(data) {
					alert("이미지 DB 등록 완료");

				}, 
				fail : function(data) {
					alert("db에 url저장 실패");
				}
			})		
		} 
	}
	
	function replaceSpacesInFileName(fileName) {
	    return fileName.replace(/\s+/g, '+');
	}
	

	</script>
</body>
	
</html>