<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<div class="area clearfix">
					<div class="category-content" id="guide_2">
						<div class="category">
							<ul class="category-list" id="js_climit_li">
								<c:forEach items="${requestScope.type}" var="r">
									<c:if test="${r.parentid==0}">
										<li class="appliance js_toggle relative first">
											<div class="category-info">
												<h3 class="category-name b-category-name">
													<a class="ml-22" title="${r.name}">${r.name}</a>
												</h3>
												<em>&gt;</em>
											</div>
									</c:if>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<c:forEach items="${requestScope.type}" var="rr">
															<dl class="dl-sort">
																<c:if test="${rr.parentid==r.id}">
																	<dt>
																		<span title="${rr.name}">${rr.name}</span>
																	</dt>
																	<c:forEach items="${requestScope.type}" var="rrr">
																		<c:if test="${rrr.parentid==rr.id}">
																			<dd>
																				<a title="${rrr.name}" href="search?type_id=${rrr.id}&id=${rrr.id}"><span>${rrr.name}</span></a>
																			</dd>
																		</c:if>
																	</c:forEach>
																</c:if>
															</dl>
														</c:forEach>
													</div>
												</div>
											</div>
										</div>
									</div>
									<b class="arrow"></b>
									<c:if test="${r.parentid==0}">
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>

				</div>