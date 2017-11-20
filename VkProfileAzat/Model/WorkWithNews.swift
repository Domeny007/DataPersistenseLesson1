import Foundation

class WorkWithNews: WorkWithData {
    
    @objc var newsMainID: Int = 0
    @objc var newsArray:[News] = [News]()
    
    init() {
        let reservedNewsMainID = UserDefaults.standard.integer(forKey: #keyPath(WorkWithNews.newsMainID))
        if (reservedNewsMainID != 0)  {
            newsMainID = reservedNewsMainID
        }
        if let newsData = UserDefaults.standard.data(forKey: #keyPath(WorkWithNews.newsArray)) {
            newsArray = News.unarchive(with: newsData)
        }
    }
    
    
    func syncSaveNews(with news: News) {
        news.newsID = newsMainID
        newsArray.append(news)
        newsMainID += 1
        UserDefaults.standard.set(News.archive(with: news), forKey: #keyPath(WorkWithNews.newsArray))
        UserDefaults.standard.set(newsMainID, forKey: #keyPath(WorkWithNews.newsMainID))
    }
    func asyncSaveNews(with news: News, completionBlock: @escaping (Bool) -> ()) {
        let queue = OperationQueue()
        queue.addOperation { [weak self] in
            guard let strongSelf = self else{return}
            strongSelf.syncSaveNews(with: news)
            completionBlock(true)
        }
    }
    
    func syncGetAllNews() -> [News] {
        return newsArray
    }
    
    func asyncGetAllNews(completionBlock: @escaping ([News]) -> ()) {
        let operationQueue = OperationQueue()
        operationQueue.addOperation { [weak self] in
            guard let strongSelf = self else{ return }
            let currentNews = strongSelf.newsArray
            completionBlock(currentNews)
        }
    }
    
    func syncSearch(id: Int) -> News {
        return newsArray[id]
    }
    
    func asyncSearchNews(id: Int, completionBlock: @escaping (News) -> ()) {
        let operationQueue = OperationQueue()
        operationQueue.addOperation { [weak self] in
            guard let strongSelf = self else {return}
                completionBlock(strongSelf.syncSearch(id: id))
        }
    }
}
