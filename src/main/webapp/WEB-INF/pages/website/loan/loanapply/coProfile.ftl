                     <!--企业概况-->
                        <div class="nlistCont" style="display:none;">
                        	<p class="ntit">企业概况</p>
                        	<form id="coProfile">
                        	<input type="hidden" id="businesstype"   name="businesstype"   value="${applytype}"/>
                            <table width="100%" class="tab3">
                            	<tr>
                                    <th><b class="red">*</b>经营范围(主营)</th>
                                    <td><input id="mainBusiness" value="${coAll.jltfispCoProfile.mainBusiness}" name="mainBusiness" type="text" class="txt validate[required,minSize[3],maxSize[1000]]" placeholder="请输入" /></td>
                                </tr>
                                <tr>
                                    <th><b class="red">*</b>经营范围(兼营)</th>
                                    <td><input id="sidelineBusses" value="${coAll.jltfispCoProfile.sidelineBusses}" name="sidelineBusses" type="text" class="txt validate[required,minSize[3],maxSize[1000]]" placeholder="请输入" /></td>
                                </tr>
                                <tr>
                                    <th><b class="red">*</b>主要技术领域</th>
                                    <td>
                                        <#if coAll.jltfispCoProfile.mainField ==1 >
                                    	<label><input type="radio" class="validate[required] " value="1" name="mainField" id="mainField" checked/>电子信息技术</label>
                                    	<#else>
                                    	<label><input type="radio" class="validate[required] " value="1" name="mainField" id="mainField"/>电子信息技术</label>
                                        </#if>
                                        <#if coAll.jltfispCoProfile.mainField ==2 >
                                        <label><input type="radio" class="validate[required]" value="2" name="mainField" id="mainField" checked/>生物医药技术</label>
                                        <#else>
                                        <label><input type="radio" class="validate[required]" value="2" name="mainField" id="mainField"/>生物医药技术</label>
                                        </#if>
                                        <#if coAll.jltfispCoProfile.mainField ==3 >
                                        <label><input type="radio" class="validate[required]" value="3" name="mainField" id="mainField" checked/>航空航天技术</label>
                                        <#else>
                                        <label><input type="radio" class="validate[required]" value="3" name="mainField" id="mainField"/>航空航天技术</label>
                                        </#if>
                                        <#if coAll.jltfispCoProfile.mainField ==4 >
                                        <label><input type="radio" class="validate[required]" value="4" name="mainField" id="mainField" checked/>新科技技术</label>
                                        <#else>
                                        <label><input type="radio" class="validate[required]" value="4" name="mainField" id="mainField"/>新科技技术</label>
                                        </#if>
                                        <#if coAll.jltfispCoProfile.mainField ==5 >
                                        <label><input type="radio" class="validate[required]" value="5" name="mainField" id="mainField" checked/>高技术服务业</label>
                                         <#else>
                                         <label><input type="radio" class="validate[required]" value="5" name="mainField" id="mainField"/>高技术服务业</label>
                                        </#if>
                                        <#if coAll.jltfispCoProfile.mainField ==6 >
                                        <label><input type="radio" class="validate[required]" value="6" name="mainField" id="mainField" checked/>新能源节能技术</label>
                                        <#else>
                                        <label><input type="radio" class="validate[required]" value="6" name="mainField" id="mainField"/>新能源节能技术</label>
                                        </#if>
                                        <#if coAll.jltfispCoProfile.mainField ==7 >
                                        <label><input type="radio" class="validate[required]" value="7" name="mainField" id="mainField" checked/>资源环境技术</label>
                                        <#else>
                                        <label><input type="radio" class="validate[required]" value="7" name="mainField" id="mainField"/>资源环境技术</label>
                                        </#if>
                                        <#if coAll.jltfispCoProfile.mainField ==8 >
                                        <label><input type="radio" class="validate[required]" value="8" name="mainField" id="mainField" checked/>高新技术改造传统行业</label>
                                        <#else>
                                        <label><input type="radio" class="validate[required]" value="8" name="mainField" id="mainField"/>高新技术改造传统行业</label>
                                        </#if>
                                    </td>
                                </tr>
                                <tr>
                                    <th><b class="red">*</b>企业性质</th>
                                    <td>
                                        <#if coAll.jltfispCoProfile.nature ==1 >
                                    	<label><input type="radio" class="validate[required]"  value="1" name="nature" id="nature" checked/>私营企业</label>
                                    	<#else>
                                    	<label><input type="radio" class="validate[required]"  value="1" name="nature" id="nature"/>私营企业</label>
                                    	</#if>
                                    	<#if coAll.jltfispCoProfile.nature ==2 >
                                        <label><input type="radio" class="validate[required]"  value="2" name="nature" id="nature" checked/>中外合资企业</label>
                                        <#else>
                                        <label><input type="radio" class="validate[required]"  value="2" name="nature" id="nature"/>中外合资企业</label>
                                        </#if>
                                        <#if coAll.jltfispCoProfile.nature ==3 >
                                        <label><input type="radio" class="validate[required]"  value="3" name="nature" id="nature" checked/>国有企业</label>
                                        <#else>
                                        <label><input type="radio" class="validate[required]"  value="3" name="nature" id="nature"/>国有企业</label>
                                        </#if>
                                        <#if coAll.jltfispCoProfile.nature ==4 >
                                        <label><input type="radio" class="validate[required]"  value="4" name="nature" id="nature" checked/>集体企业</label><br/>
                                        <#else >
                                        <label><input type="radio" class="validate[required]"  value="4" name="nature" id="nature"/>集体企业</label><br/>
                                        </#if>
                                        <div class="else">其他<input name="otherNature" value="${coAll.jltfispCoProfile.otherNature}" id="otherNature" type="text" class="txt validate[maxSize[1000]]" /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th><b class="red">*</b>职工总数</th>
                                    <td>
                                    	<input id="workforce" name="workforce" value="${coAll.jltfispCoProfile.workforce}" type="text" class="txt validate[required,minSize[1],maxSize[1000],custom[integer]]" style="width:60px;" />人
                                        <span style="margin-left:30px;">其中：大专以上人数</span><input name="collegeDegreeOrAboveNum" id="collegeDegreeOrAboveNum" value="${coAll.jltfispCoProfile.collegeDegreeOrAboveNum}" type="text" class="txt" style="width:60px;" />人<span style="margin-left:30px;">研发人员</span><input name="researchStaffNum" id="researchStaffNum" value="${coAll.jltfispCoProfile.researchStaffNum}" type="text" class="txt" style="width:60px;" />人<br /><i class="gray6 tip2">提示：如果没有大专人数或者没有研发人员可填0！</i>
                                    </td>
                                </tr>
                            </table>
                            <p class="ntit">知识产权授权和科技认定状况(选填)</p>
                            <table width="100%" class="tab3">
                            	<tr>
                                    <th>已获得知识产权总数</th>
                                    <td colspan="3"><input id="intellectualPropertyNum" name="intellectualPropertyNum" value="${coAll.jltfispCoProfile.intellectualPropertyNum}" type="text" class="txt validate[maxSize[1000],custom[integer]]" style="width:60px;" />个</td>
                                </tr>
                                <tr>
                                    <th>发明专利</th>
                                    <td><input name="patentOfInventionNum" id="patentOfInventionNum" type="text" value="${coAll.jltfispCoProfile.patentOfInventionNum}"  class="txt validate[maxSize[1000],custom[integer]]" style="width:60px;" />个</td>
                                    <th>实用新型专利</th>
                                    <td><input name="utilityModelPatentNum" id="utilityModelPatentNum" type="text" value="${coAll.jltfispCoProfile.utilityModelPatentNum}" class="txt validate[maxSize[1000],custom[integer]]" style="width:60px;" />个</td>
                                </tr>
                                <tr>
                                    <th>软件著作权</th>
                                    <td><input name="softwareCopyrightNum" id="softwareCopyrightNum" value="${coAll.jltfispCoProfile.softwareCopyrightNum}" type="text" class="txt validate[maxSize[1000],custom[integer]]" style="width:60px;" />个</td>
                                    <th>集成电路设计板块</th>
                                    <td><input name="integratedCircuitDesignNum" id="integratedCircuitDesignNum" value="${coAll.jltfispCoProfile.integratedCircuitDesignNum}" type="text" class="txt validate[maxSize[1000],custom[integer]]" style="width:60px;" />个</td>
                                </tr>
                                <tr>
                                    <th>企业曾获得科技认定<br/>或资助情况(可多选)</th>
                                    <td colspan="3">
                                    	<label><input type="checkbox" value="1" name="technologyOrFinance" id="technologyOrFinance1" />高科技企业</label>
                                        <label><input type="checkbox" value="2" name="technologyOrFinance" id="technologyOrFinance2" />科技小巨人企业</label>
                                        <label><input type="checkbox" value="3" name="technologyOrFinance" id="technologyOrFinance3" />科技小巨人培育企业</label>
                                        <label><input type="checkbox" value="4" name="technologyOrFinance" id="technologyOrFinance4" />软件企业</label>
                                        <label><input type="checkbox" value="5" name="technologyOrFinance" id="technologyOrFinance5" />技术先进企业</label>
                                        <label><input type="checkbox" value="6" name="technologyOrFinance" id="technologyOrFinance6" />创新性企业</label><br/>
                                        <label><input type="checkbox" value="7" name="technologyOrFinance" id="technologyOrFinance7" />专利示范企业</label><br/>
                                        <div class="else">自填<input name="OtherTechnologyOrFinance"  value="${coAll.jltfispCoProfile.otherTechnologyOrFinance}" id="OtherTechnologyOrFinance" type="text" class="txt validate[maxSize[1000]]" /></div>
                                    </td>
                                </tr>
                            </table>
                            <p class="ntit">企业情况概述(300字以内)</p>
                            <table width="100%" class="tab3">
                            	<tr>
                                    <th><b class="red">*</b>企业简介</th>
                                    <td><textarea id="institutionalAbstract" value="${coAll.jltfispCoProfile.institutionalAbstract}" name="institutionalAbstract" class="txta validate[required,minSize[6],maxSize[1000]]">${coAll.jltfispCoProfile.institutionalAbstract}</textarea></td>
                                </tr>
                                <tr>
                                    <th><b class="red">*</b>管理团队简介(主要经<br/>营、管理、技术人员背景)</th>
                                    <td><textarea name="managementTeamProfile"  id="managementTeamProfile" class="txta validate[required,minSize[6],maxSize[1000]]">${coAll.jltfispCoProfile.managementTeamProfile}</textarea></td>
                                </tr>
                                <tr>
                                    <th><b class="red">*</b>主营产品简介(产品特点、销售市场、<br/>主要客户等)</th>
                                    <td><textarea name="mainProductIntroduction"   id="mainProductIntroduction" class="txta validate[required,minSize[6],maxSize[1000]]">${coAll.jltfispCoProfile.mainProductIntroduction}</textarea></td>
                                </tr>
                            </table>
                            </form>
                            <div class="btnFld"><input type="button" value="保存并下一步" class="btnSave" /><a href="${path}/loan/onlineApplyPage"><input type="button" class="btnCan" value="取消" /></a></div>
                        </div>