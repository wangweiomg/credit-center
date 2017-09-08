'use strict';
$(document).ready(function(){
	$(document).on("click","#depotName",function(){
		var depotCode = $(this).parent().children("#depotCode").val();
		console.log(depotCode);
		
		$.ajax({ 
			  type: 'GET',
			  url: "queryDepotInfo",	
			  data: {"depotCode":depotCode},
			  dataType:"json",
			  success: function(data){
				  $("#depotDetailName").text(data.storName);
				  $("#depotDetailAddress").text(data.address);
				  $("#depotDetailScope").text(data.storLimit);
				  $("#depotDetailBelong").text(data.owner);
				  $("#depotDetailType").text(data.storType);
				  $("#depotDetailCnt").text(data.carportCnt);
				  $("#depotDetailContact").text(data.contact);
				  $("#depotDetailPhone").text(data.phone);
				  $("#depotDetailRemark").text(data.remark);
			  },
		});
		
		$.ajax({ 
			  type: 'GET',
			  url: "queryCarsInfo",	
			  data: {"depotCode":depotCode},
			  dataType:"json",
			  success: function(data){
				  var carsInfo = $("#carsInfo");
				  var carTotalInfo = $("#carTotalInfo");
				  carsInfo.empty();
				  carTotalInfo.empty();
				  var carTotalCnt = 0;
				  var carTotalAmt = 0;
				  var addCarInfo = '';
				  var addCarTotalInfo = '';
				  if(data.length == 0){
					  carTotalInfo.append("<label>无在库车辆信息</label><br>");
				  }else{
					  for(var i=0;i<data.length;i++){
						  addCarInfo += '<tr>'
							+ 		'<th scope="row">'+(i+1)+'</th>'
							+		'<td>'+data[i].carriageCode+'</td>'
							+		'<td>'+data[i].regName+'</td>'
							+		'<td>'+data[i].cfOutDate+'</td>'
							+		'<td>'+data[i].carBrand+'</td>'
							+		'<td>'+data[i].carStyle+'</td>'
							+		'<td>'+data[i].apprEval+'</td>'
							+		'<td>'+data[i].contrNo+'</td>'
							+	'</tr>';
						  
						  carTotalCnt++;
						  carTotalAmt += parseFloat(data[i].apprEval);
					  }
				  }
				  
				  addCarTotalInfo += '<label><strong>车辆共：'+carTotalCnt+'台</strong></labe><label><strong>&nbsp;| 在库车辆价值：'+carTotalAmt.toFixed(2)+'万元</strong></labe>';
				  carTotalInfo.append(addCarTotalInfo);
				  carsInfo.append(addCarInfo);
			  },
		});
	})
	
	$(document).on("change",'select#selectDepot',function(){
		var depotCode = $(this).val();
		$.ajax({ 
			  type: 'GET',
			  url: "queryCarCntByDepotCode",	
			  data: {"depotCode":depotCode},
			  dataType:"json",
			  success: function(data){
				  $("#inStockCnt").val(data);
			  },
		});
	});
	
	$(document).on("change",'select#selectDepotLocCity',function(){
		var provCode = $("#selectDepotLocProv").val();
		var cityCode = $("#selectDepotLocCity").val();
		
		$.ajax({ 
			  type: 'GET',
			  url: "queryDepotByProvAndCity",	
			  data: {"provCode":provCode, "cityCode":cityCode},
			  dataType:"json",
			  success: function(data){
				  var selectDepot = $("#selectDepot");
					selectDepot.empty();
					var depots = "";
					depots += '<option selected="selected" disabled="disabled">--仓库名--</option>';
					for(var i=0;i<data.length;i++){
						var storInfo = data[i].storCode;
						storInfo += ",";
						storInfo += data[i].storName;
						storInfo += ",";
						storInfo += data[i].address;
						depots += '<option value="'+storInfo+'">'+data[i].storName+'</option>';
					}
					selectDepot.append(depots);
			  }
		});
	});
	
});
