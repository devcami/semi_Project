package wishlist.model.service;

import static common.JdbcTemplate.close;
import static common.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import ann.model.dto.Ann;
import mypage.model.dto.ActorInfo;
import mypage.model.dto.PortAttachment;
import wishlist.model.dao.WishListDao;

public class WishListService {
	private WishListDao wishListDao = new WishListDao();
	public static final int WISH_NUM_PER_PAGE = 8;

	/**
	 * 은성부분
	 * @author jes
	 */
	public int getTotalContent(String memberId) {
		Connection conn = getConnection();
		int totalContent = wishListDao.getTotalContent(conn, memberId);
		close(conn);
		return totalContent;
		
	}

	public List<Ann> annEndDateSort(String memberId, Map<String, Object> param) {
		Connection conn = getConnection();
		List<Ann> list = wishListDao.annEndDateSort(conn, memberId, param);
		close(conn);
		return list;
	}

	public List<Ann> findAll(String memberId, Map<String, Object> param) {
		Connection conn = getConnection();
		List<Ann> list = wishListDao.findAll(conn, memberId, param);
		close(conn);
		return list;
	}

	public int getTotalActorWishContent(String memberId) {
		Connection conn = getConnection();
		int totalContent = wishListDao.getTotalActorWishContent(conn, memberId);
		close(conn);
		return totalContent;
	}

	public List<ActorInfo> actorEndDateSort(String memberId, Map<String, Object> param) {
		Connection conn = getConnection();
		List<ActorInfo> list = wishListDao.actorEndDateSort(conn, memberId, param);
		String type = "P";
		for(int i = 0; i < list.size(); i++) {
			String actor = list.get(i).getMemberId();
			PortAttachment profilePic = wishListDao.getProfilePic(conn, actor, type);
			list.get(i).setAttachment(profilePic);
		}
		close(conn);
		return list;
	}

	public List<ActorInfo> findAllWishActor(String memberId, Map<String, Object> param) {
		Connection conn = getConnection();
		List<ActorInfo> list = wishListDao.findAllWishActor(conn, memberId, param);
		String type = "P";
		for(int i = 0; i < list.size(); i++) {
			String actor = list.get(i).getMemberId();
			PortAttachment profilePic = wishListDao.getProfilePic(conn, actor, type);
			list.get(i).setAttachment(profilePic);
		}
		close(conn);
		return list;
		
	}
	
	
}
