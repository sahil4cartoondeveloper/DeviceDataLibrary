//
//  APICallViewController.swift
//  DeviceData_Example
//
//  Created by sahil vadadoriya on 22/10/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

class APICallViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var apiCallType: ApiType?
    var serviceCall = ServiceCall()
    var userListArray: [UserDataModel] = []
    var postListArray: [PostDataResponse] = []
    var commentListArray: [CommentsDataResponse] = []
    var albumListArray: [AlbumsDataResponse] = []
    var photosListArray: [PhotosDataResponse] = []
    var todosListArray: [TodosDataResponse] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpScrennUI()
    }
    
    private func setUpScrennUI() {
        
        let tableviewCellXIB = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(tableviewCellXIB, forCellReuseIdentifier: "TableViewCell")
        
        switch apiCallType {
        case .one:
            self.apiCall()
            break
        case .two:
            self.postAPICall()
            break
        case .three:
            self.commentsAPICall()
            break
        case .four:
            self.albumsAPICall()
            break
        case .five:
            self.photosAPICall()
            break
        case .six:
            self.todosAPICall()
            break
        case .none:
            break
        }
    }
    
    private func apiCall() {
        serviceCall.getUserDataServiceCall { response in
            print("Respons :- \(response)")
            self.userListArray = response
            self.tableView.reloadData()
        } errorBlock: { (errorMessage: String) in
            print(errorMessage)
        }
    }
    
    private func postAPICall() {
        serviceCall.getPostDataServiceCall { response in
            print("Respons :- \(response)")
            self.postListArray = response
            self.tableView.reloadData()
        } errorBlock: { (errorMessage: String) in
            print(errorMessage)
        }
    }
    
    private func commentsAPICall() {
        serviceCall.getCommentsDataServiceCall { response in
            print("Respons :- \(response)")
            self.commentListArray = response
            self.tableView.reloadData()
        } errorBlock: { (errorMessage: String) in
            print(errorMessage)
        }
    }
    
    private func albumsAPICall() {
        serviceCall.getAlbumsDataServiceCall { response in
            print("Respons :- \(response)")
            self.albumListArray = response
            self.tableView.reloadData()
        } errorBlock: { (errorMessage: String) in
            print(errorMessage)
        }
    }
    
    private func photosAPICall() {
        serviceCall.getPhotosDataServiceCall { response in
            print("Respons :- \(response)")
            self.photosListArray = response
            self.tableView.reloadData()
        } errorBlock: { (errorMessage: String) in
            print(errorMessage)
        }
    }
    
    private func todosAPICall() {
        serviceCall.getTodosDataServiceCall { response in
            print("Respons :- \(response)")
            self.todosListArray = response
            self.tableView.reloadData()
        } errorBlock: { (errorMessage: String) in
            print(errorMessage)
        }
    }
}

extension APICallViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch apiCallType {
        case .one:
            return self.userListArray.count
        case .two:
            return self.postListArray.count
        case .three:
            return self.commentListArray.count
        case .four:
            return self.albumListArray.count
        case .five:
            return self.postListArray.count
        case .six:
            return self.todosListArray.count
        case .none:
            break
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch apiCallType {
        case .one:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
            self.configureUserData(cell: cell, indexPathForCell: indexPath)
            return cell ?? UITableViewCell()
        case .two:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
            self.configurePostData(cell: cell, indexPathForCell: indexPath)
            return cell ?? UITableViewCell()
        case .three:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
            self.configureCommentData(cell: cell, indexPathForCell: indexPath)
            return cell ?? UITableViewCell()
        case .four:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
            self.configureAlbumData(cell: cell, indexPathForCell: indexPath)
            return cell ?? UITableViewCell()
        case .five:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
            self.configurePhotosData(cell: cell, indexPathForCell: indexPath)
            return cell ?? UITableViewCell()
        case .six:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
            self.configureTodosData(cell: cell, indexPathForCell: indexPath)
            return cell ?? UITableViewCell()
        case .none:
            break
        }
        return UITableViewCell()
    }
    
    private func configureUserData(cell: TableViewCell?, indexPathForCell: IndexPath) {
        let objUserList = self.userListArray[indexPathForCell.row]
        cell?.titleLabel.text = objUserList.username
    }
    
    private func configurePostData(cell: TableViewCell?, indexPathForCell: IndexPath) {
        let objPostList = self.postListArray[indexPathForCell.row]
        cell?.titleLabel.text = objPostList.title
    }
    
    private func configureCommentData(cell: TableViewCell?, indexPathForCell: IndexPath) {
        let objCommentList = self.commentListArray[indexPathForCell.row]
        cell?.titleLabel.text = objCommentList.name
    }
    
    private func configureAlbumData(cell: TableViewCell?, indexPathForCell: IndexPath) {
        let objAlbumList = self.albumListArray[indexPathForCell.row]
        cell?.titleLabel.text = objAlbumList.title
    }
    
    private func configurePhotosData(cell: TableViewCell?, indexPathForCell: IndexPath) {
        let objPhotosList = self.photosListArray[indexPathForCell.row]
        cell?.titleLabel.text = objPhotosList.title
        cell?.profileImageView.image = UIImage(named: objPhotosList.thumbnailUrl ?? "")
    }
    
    private func configureTodosData(cell: TableViewCell?, indexPathForCell: IndexPath) {
        let objTodosList = self.todosListArray[indexPathForCell.row]
        cell?.titleLabel.text = objTodosList.title
    }
}
