package ex.op.om.service;

import ex.op.om.vo.BSMNBuildCarriagewayFormVO;
import ex.op.om.vo.BSMNBuildFacilityFormVO;
import ex.op.om.vo.BSMNBuildMngFormVO;
import ex.op.om.vo.BSMNBuildWorkSectionFormVO;
import ex.op.om.vo.BSMNMaintainMngFormVO;
import ex.op.om.vo.BSMNRouteCarriagewayFormVO;
import ex.op.om.vo.BSMNRouteFacilityFormVO;
import ex.op.om.vo.BSMNRouteMngFormVO;
import fleta.framework.grid.rowset.RowSet;

/**
 * 노선 관리 Service
 *
 * @author 서재현
 * @version 1.0
 * <li> (2012.11.13) 서재현, 최초 작성</li>
 */
public interface BSMNService {

    /**
     * 노선 등록, 수정
     *
     * @param formVO BSMNRouteMngFormVO
     */
    void saveBSMNRouteMngD1(BSMNRouteMngFormVO formVO);

    /**
     * 상세노선번호 등록 유/무 체크
     *
     * @param formVO
     * @return String
     */
    String checkSsnsbeonho(BSMNRouteMngFormVO formVO);

    /**
     * 노선 삭제
     *
     * @param formVO BSMNRouteMngFormVO
     */
    void deleteBSMNRouteMngD1(BSMNRouteMngFormVO formVO);

    /**
     * 노선정보 조회
     *
     * @param formVO BSMNRouteMngFormVO
     * @return RowSet
     */
    RowSet searchBSMNRouteMngD1(BSMNRouteMngFormVO formVO);

    /**
     * 노선 기본정보 조회
     *
     * @param formVO
     * @return
     */
    BSMNRouteMngFormVO selectBSMNRouteInfo(BSMNRouteMngFormVO formVO);

    /**
     * 차로현황 조회
     *
     * @param formVO BSMNRouteCarriagewayFormVO
     * @return RowSet
     */
    RowSet searchBSMNRouteCarriagewayD1(BSMNRouteCarriagewayFormVO formVO);

    /**
     * 차로 건설(예정)현황 조회
     *
     * @param formVO BSMNRouteCarriagewayFormVO
     * @return RowSet
     */
    RowSet searchBSMNRouteCarriagewayD2(BSMNRouteCarriagewayFormVO formVO);

    /**
     * 시설관리 - 시설현황
     *
     * @param formVO BSMNRouteMngFormVO
     * @return RowSet
     */
    RowSet searchBSMNRouteFacilityD1(BSMNRouteMngFormVO formVO);

    /**
     * 시설관리 - 건설(예정)현황 조회
     *
     * @param formVO BSMNRouteMngFormVO
     * @return RowSet
     */
    RowSet searchBSMNRouteFacilityD2(BSMNRouteMngFormVO formVO);

    /**
     * 건설구간 조회
     *
     * @param formVO BSMNBuildMngFormVO
     * @return RowSet
     */
    RowSet searchBSMNBuildMngD1(BSMNBuildMngFormVO formVO);

    /**
     * 건설구간 등록, 수정
     *
     * @param formVO BSMNBuildMngFormVO
     */
    void saveBSMNBuildMngD1(BSMNBuildMngFormVO formVO);

    /**
     * 건설구간 삭제
     *
     * @param formVO BSMNBuildMngFormVO
     */
    void deleteBSMNBuildMngD1(BSMNBuildMngFormVO formVO);

    /**
     * 현재 사용자의 소속부서가 도로처, 지사,건설사업단 소속인지 체크
     *
     * @param userId
     * @return String
     */
    String checkBSMNRouteMng(String userId);

    /**
     * 현재 사용자의 소속부서가 도로처, 건설사업단 소속인지 체크
     *
     * @param userId
     * @return String
     */
    String checkBSMNBuildMng(String userId);

    /**
     * 건설구간번호에 해당하는 기본정보 조회
     *
     * @param formVO BSMNBuildMngFormVO
     * @return BSMNBuildMngFormVO
     */
    BSMNBuildMngFormVO BSMNBuildInfo(BSMNBuildMngFormVO formVO);

    /**
     * 공사구간 조회
     *
     * @param formVO BSMNRouteMngFormVO
     * @return RowSet
     */
    RowSet searchBSMNBuildWorkSectionD1(BSMNBuildWorkSectionFormVO formVO);

    /**
     * 공사구간 일련번호 존재 유/무 체크
     *
     * @param formVO BSMNBuildWorkSectionFormVO
     * @return String
     */
    String checkBSMNBuildWorkSectionD1(BSMNBuildWorkSectionFormVO formVO);

    /**
     * 공사구간 등록, 수정
     *
     * @param formVO BSMNBuildMngFormVO
     */
    void saveBSMNBuildWorkSectionD1(BSMNBuildWorkSectionFormVO formVO);

    /**
     * 공사구간 삭제
     *
     * @param formVO BSMNBuildWorkSectionFormVO
     */
    void deleteBSMNBuildWorkSectionD1(BSMNBuildWorkSectionFormVO formVO);

    /**
     * 시설 조회
     *
     * @param formVO BSMNBuildFacilityFormVO
     * @return RowSet
     */
    RowSet searchBSMNBuildFacilityD1(BSMNBuildFacilityFormVO formVO);

    /**
     * 시설 등록, 수정
     *
     * @param formVO BSMNBuildFacilityFormVO
     * @return Object
     */
    void saveBSMNBuildFacilityD1(BSMNBuildFacilityFormVO formVO);

    /**
     * 시설 삭제
     *
     * @param formVO BSMNBuildFacilityFormVO
     * @return Object
     */
    void deleteBSMNBuildFacilityD1(BSMNBuildFacilityFormVO formVO);

    /**
     * 차로 등록, 수정
     *
     * @param formVO BSMNBuildCarriagewayFormVO
     */
    void saveBSMNBuildCarriagewayD1(BSMNBuildCarriagewayFormVO formVO);

    /**
     * 차로 삭제
     *
     * @param formVO BSMNBuildCarriagewayFormVO
     */
    void deleteBSMNBuildCarriagewayD1(BSMNBuildCarriagewayFormVO formVO);

    /**
     * 차로 조회
     *
     * @param formVO BSMNBuildCarriagewayFormVO
     * @return RowSet
     */
    RowSet searchBSMNBuildCarriagewayD1(BSMNBuildCarriagewayFormVO formVO);

    /**
     * 차로 전환
     *
     * @param formVO BSMNBuildCarriagewayFormVO
     */
    void saveBSMNBuildCarriagewayD1Change(BSMNBuildCarriagewayFormVO formVO);

    /**
     * 노선 차로 등록, 수정
     *
     * @param formVO BSMNRouteCarriagewayFormVO
     */
    void saveBSMNRouteCarriagewayD1(BSMNRouteCarriagewayFormVO formVO);

    /**
     * 노선 차로 삭제
     *
     * @param formVO BSMNRouteCarriagewayFormVO
     */
    void deleteBSMNRouteCarriagewayD1(BSMNRouteCarriagewayFormVO formVO);

    /**
     * 시설 등록, 수정
     *
     * @param formVO BSMNRouteFacilityFormVO
     */
    void saveBSMNRouteFacilityD1(BSMNRouteFacilityFormVO formVO);

    /**
     * 시설 삭제
     *
     * @param formVO BSMNRouteFacilityFormVO
     */
    void deleteBSMNRouteFacilityD1(BSMNRouteFacilityFormVO formVO);

    /**
     * 현재 사용자의 소속부서가 지역본부, 지역본부(처,팀) 소속인지 체크
     *
     * @param userId
     * @return String
     */
    String checkBSMNMaintainMng(String userId);

    /**
     * 지사 관리구간 조회
     *
     * @param formVO BSMNMaintainMngFormVO
     * @return RowSet
     */
    RowSet searchBSMNMaintainMngD1(BSMNMaintainMngFormVO formVO);

    /**
     * 지사 관리구간 등록, 수정
     *
     * @param formVO BSMNMaintainMngFormVO
     */
    void saveBSMNMaintainMngD1(BSMNMaintainMngFormVO formVO);

    /**
     * 지사 관리구간 삭제
     *
     * @param formVO BSMNMaintainMngFormVO
     */
    void deleteBSMNMaintainMngD1(BSMNMaintainMngFormVO formVO);

    /**
     * 지사 관리구간 등록,수정 시 중복여부 체크
     *
     * @param formVO BSMNMaintainMngFormVO
     * @return String
     */
    String checkBSMNMaintainCheck(BSMNMaintainMngFormVO formVO);

    /**
     * 지사 관리구간(보정정보) 조회
     *
     * @param formVO BSMNMaintainMngFormVO
     * @return RowSet
     */
    RowSet searchBSMNMaintainMngD2(BSMNMaintainMngFormVO formVO);

    /**
     * 지사 관리구간(보정정보) 삭제
     *
     * @param formVO BSMNMaintainMngFormVO
     */
    void deleteBSMNMaintainMngD2(BSMNMaintainMngFormVO formVO);

    /**
     * 지사 관리구간(보정정보) 등록, 수정
     *
     * @param formVO BSMNMaintainMngFormVO
     */
    void saveBSMNMaintainMngD2(BSMNMaintainMngFormVO formVO);
	
	/**
     * TEST
     *
     * @param formVO BSMNMaintainMngFormVO
     */
	 void searchTestD1(BSMNMaintainMngFormVO formVO);
}
