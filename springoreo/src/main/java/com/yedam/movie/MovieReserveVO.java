package com.yedam.movie;

import java.util.Arrays;
import java.util.List;

public class MovieReserveVO {
	private String movieTitle;
	private String endDate;
	private String movieGenre;
	private String movie;
	private String theaterId;
	private String theaterName;
	private String theaterFirstLoc;
	private String theaterSecondLoc;
	private String roomName;
	private String screenStartTime;
	private String roomId;
	private String eventInfo;
	private String theatherId;
	private String movieShowtime;
	@Override
	public String toString() {
		return "MovieReserveVO [movieTitle=" + movieTitle + ", endDate=" + endDate + ", movieGenre=" + movieGenre
				+ ", movie=" + movie + ", theaterId=" + theaterId + ", theaterName=" + theaterName
				+ ", theaterFirstLoc=" + theaterFirstLoc + ", theaterSecondLoc=" + theaterSecondLoc + ", roomName="
				+ roomName + ", screenStartTime=" + screenStartTime + ", roomId=" + roomId + ", eventInfo=" + eventInfo
				+ ", theatherId=" + theatherId + ", movieShowtime=" + movieShowtime + ", movieDirector=" + movieDirector
				+ ", movieSummary=" + movieSummary + ", movieTrailer=" + movieTrailer + ", movieOpenDate="
				+ movieOpenDate + ", reviewStar=" + reviewStar + ", actor=" + actor + ", actorId=" + actorId
				+ ", actorName=" + actorName + ", charName=" + charName + ", actorPhoto=" + actorPhoto + ", actorRole="
				+ actorRole + ", reviewId=" + reviewId + ", reviewContent=" + reviewContent + ", moviePoster="
				+ moviePoster + ", search=" + search + ", theatherFirstLoc=" + theatherFirstLoc + ", theatherSecondLoc="
				+ theatherSecondLoc + ", movieAge=" + movieAge + ", genre=" + Arrays.toString(genre) + ", movieDate="
				+ movieDate + ", screenId=" + screenId + ", screenTimes=" + screenTimes + ", movieId=" + movieId
				+ ", custNum=" + custNum + ", screenEvent=" + screenEvent + "]";
	}
	private String movieDirector;
	private String movieSummary;
	private String movieTrailer;
	private String movieOpenDate;
	private String reviewStar;
	private String actor;
	private String actorId;
	private String actorName;
	private String charName;
	private String actorPhoto;
	private String actorRole;
	private String reviewId;
	private String reviewContent;
	private String moviePoster;
	private String search;
	private String theatherFirstLoc;
	private String theatherSecondLoc;
	
	public String getTheaterId() {
		return theaterId;
	}
	public void setTheaterId(String theaterId) {
		this.theaterId = theaterId;
	}
	public String getTheaterName() {
		return theaterName;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
	public String getTheaterFirstLoc() {
		return theaterFirstLoc;
	}
	public void setTheaterFirstLoc(String theaterFirstLoc) {
		this.theaterFirstLoc = theaterFirstLoc;
	}
	public String getTheaterSecondLoc() {
		return theaterSecondLoc;
	}
	public void setTheaterSecondLoc(String theaterSecondLoc) {
		this.theaterSecondLoc = theaterSecondLoc;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getScreenStartTime() {
		return screenStartTime;
	}
	public void setScreenStartTime(String screenStartTime) {
		this.screenStartTime = screenStartTime;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getEventInfo() {
		return eventInfo;
	}
	public void setEventInfo(String eventInfo) {
		this.eventInfo = eventInfo;
	}
	public String getTheatherId() {
		return theatherId;
	}
	public void setTheatherId(String theatherId) {
		this.theatherId = theatherId;
	}
	public String getMovieShowtime() {
		return movieShowtime;
	}
	public void setMovieShowtime(String movieShowtime) {
		this.movieShowtime = movieShowtime;
	}
	public String getMovieDirector() {
		return movieDirector;
	}
	public void setMovieDirector(String movieDirector) {
		this.movieDirector = movieDirector;
	}
	public String getMovieSummary() {
		return movieSummary;
	}
	public void setMovieSummary(String movieSummary) {
		this.movieSummary = movieSummary;
	}
	public String getMovieTrailer() {
		return movieTrailer;
	}
	public void setMovieTrailer(String movieTrailer) {
		this.movieTrailer = movieTrailer;
	}
	public String getMovieOpenDate() {
		return movieOpenDate;
	}
	public void setMovieOpenDate(String movieOpenDate) {
		this.movieOpenDate = movieOpenDate;
	}
	public String getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(String reviewStar) {
		this.reviewStar = reviewStar;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getActorId() {
		return actorId;
	}
	public void setActorId(String actorId) {
		this.actorId = actorId;
	}
	public String getActorName() {
		return actorName;
	}
	public void setActorName(String actorName) {
		this.actorName = actorName;
	}
	public String getCharName() {
		return charName;
	}
	public void setCharName(String charName) {
		this.charName = charName;
	}
	public String getActorPhoto() {
		return actorPhoto;
	}
	public void setActorPhoto(String actorPhoto) {
		this.actorPhoto = actorPhoto;
	}
	public String getActorRole() {
		return actorRole;
	}
	public void setActorRole(String actorRole) {
		this.actorRole = actorRole;
	}
	public String getReviewId() {
		return reviewId;
	}
	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getMoviePoster() {
		return moviePoster;
	}
	public void setMoviePoster(String moviePoster) {
		this.moviePoster = moviePoster;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getTheatherFirstLoc() {
		return theatherFirstLoc;
	}
	public void setTheatherFirstLoc(String theatherFirstLoc) {
		this.theatherFirstLoc = theatherFirstLoc;
	}
	public String getTheatherSecondLoc() {
		return theatherSecondLoc;
	}
	public void setTheatherSecondLoc(String theatherSecondLoc) {
		this.theatherSecondLoc = theatherSecondLoc;
	}
	public String getMovieDate() {
		return movieDate;
	}
	public void setMovieDate(String movieDate) {
		this.movieDate = movieDate;
	}
	public String getScreenId() {
		return screenId;
	}
	public void setScreenId(String screenId) {
		this.screenId = screenId;
	}
	public String getScreenTimes() {
		return screenTimes;
	}
	public void setScreenTimes(String screenTimes) {
		this.screenTimes = screenTimes;
	}
	public String getMovieId() {
		return movieId;
	}
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	public String getCustNum() {
		return custNum;
	}
	public void setCustNum(String custNum) {
		this.custNum = custNum;
	}
	public String getScreenEvent() {
		return screenEvent;
	}
	public void setScreenEvent(String screenEvent) {
		this.screenEvent = screenEvent;
	}
	private String movieAge;
	private String [] genre;
	private String movieDate; 
	private String screenId; 
	private String screenTimes;
	private String movieId;
	private String custNum ;
	private String screenEvent; 
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	
	public String getMovieAge() {
		return movieAge;
	}
	public void setMovieAge(String movieAge) {
		this.movieAge = movieAge;
	}
	
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getMovieGenre() {
		return movieGenre;
	}
	public void setMovieGenre(String movieGenre) {
		this.movieGenre = movieGenre;
	}
	public String [] getGenre() {
		return genre;
	}
	public void setGenre(String [] genre) {
		this.genre = genre;
	}
	public String getMovie() {
		return movie;
	}
	public void setMovie(String movie) {
		this.movie = movie;
	}
	
	
	

	
	
}
