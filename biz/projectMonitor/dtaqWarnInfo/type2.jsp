<%@ page contentType="text/html;charset=UTF-8" %>
<div class="tableRegion">
<table border="0"  cellpadding="0"  cellspacing="0">
<tr>
<td><div class="grid">
<table border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse;" id="contractInfoList"><thead>
    <tr>
    <th class="tableHeader" style="border:1px solid #D9E8FB;"  onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="80">预警状态</th>
    <th class="tableHeader" style="border:1px solid #D9E8FB;"  onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="80">测点编码</th>
    <th class="tableHeader" style="border:1px solid #D9E8FB;" onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="100">测点里程</th>
    <th class="tableHeader" style="border:1px solid #D9E8FB;" onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="90">初始坐标/观测值(m)</th>
    <th class="tableHeader" style="border:1px solid #D9E8FB;" onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="90">本次坐标/观测值(m)</th>
    <th class="tableHeader" style="border:1px solid #D9E8FB;" onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="80">上次坐标/观测值(m)</th>
    <th class="tableHeader" style="border:1px solid #D9E8FB;" onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="90">本次坐标/收敛值(mm)</th>
    <th class="tableHeader" style="border:1px solid #D9E8FB;" onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="110">位移/收敛速率(mm/d)</th>
    <th class="tableHeader" style="border:1px solid #D9E8FB;" onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="90">累计位移/收敛(mm)</th>
    <th class="tableHeader" style="border:1px solid #D9E8FB;" onmouseover="this.className='tableHeaderSort';"  onmouseout="this.className='tableHeader';"  width="120">观测日期</th>
    </tr>
 </thead>
  <tbody>
<c:set var="idx" value="0"/>
<c:forEach items="${datas}" var="data">
<tr id="tr_${idx}">
	<input type="hidden" class="lineinput" readonly="readonly" name="warn_memo" id="warn_memo_${idx}" value="${data.warn_memo}"/>
  <td style="border:1px solid #D9E8FB;"><div class="state${data.warn_state}  stateDiv"></div></td>
  <td style="border:1px solid #D9E8FB;">
    ${data.point_code}
  </td>
  <td style="border:1px solid #D9E8FB;">${data.point_distance}</td>
  <td style="border:1px solid #D9E8FB;">${data.init_value}</td>
  <td style="border:1px solid #D9E8FB;">${data.curr_value}</td>
  <td style="border:1px solid #D9E8FB;">${data.prev_value}</td>
  <td style="border:1px solid #D9E8FB;">${data.curr_change}</td>
  <td style="border:1px solid #D9E8FB;">${data.change_rate}</td>
  <td style="border:1px solid #D9E8FB;">${data.total_change}</td>
  <td style="border:1px solid #D9E8FB;"><fmt:formatDate value="${data.write_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
</tr>
<c:set var="idx" value="${idx+1}"/>
</c:forEach>
  </tbody>
</table>
</div>
</td>
</tr>
</table>