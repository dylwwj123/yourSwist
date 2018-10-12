//
//  NodeBooksViewController.swift
//  Peace
//
//  Created by 王文帅 on 2018/10/11.
//  Copyright © 2018年 wenshuai. All rights reserved.
//

import UIKit
import SnapKit

class NodeBooksViewController: WSBaseViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        super.navTitle(title: "随心笔记")
        self.navigationItem.leftBarButtonItem  = UIBarButtonItem(customView: self.navLeftBtn)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.navRightBtn)
    
        self.view.addSubview(self.tableView);
        self.setSubViewLayout()
        
    }
    
    private func setSubViewLayout() {
        self.tableView.snp.makeConstraints { (make) -> Void in
            make.top.left.bottom.right.equalTo(0)
        }
    }
    
    @objc private func navLeftBtnSEL(sender:UIButton?){
        
    }
    
    @objc private func navRightBtnSEL(sender:UIButton?){
        
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.arrList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
      
        let identifier:String = "NodeBooksViewControllerCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if cell == nil{
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: identifier)
        }
        
        cell?.selectionStyle = UITableViewCell.SelectionStyle.none
        
        cell?.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        cell?.backgroundColor = UIColor.init(red: 41/255.0, green: 42/255.0, blue: 47/255.0, alpha: 1.0)
        
        return cell!
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 0.0001
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 0.0001
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    lazy var arrList: NSMutableArray = {
        var muarr = NSMutableArray()
        return muarr
    }()
    
    lazy var navLeftBtn : UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x:kScreenWidth, y:0, width:40, height:20)
        btn.setTitle("编辑", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Georgia-Bold", size: 18)
        btn.addTarget(self, action: #selector(navLeftBtnSEL(sender:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var navRightBtn : UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x:0, y:0, width:40, height:20)
        btn.setTitle("添加", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Georgia-Bold", size: 18)
        btn.addTarget(self, action: #selector(navRightBtnSEL(sender:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var tableView : UITableView = {
        let tempList = UITableView.init()
        tempList.delegate = self
        tempList.dataSource = self
        tempList.backgroundColor = UIColor.init(red: 41/255.0, green: 42/255.0, blue: 47/255.0, alpha: 1.0)
        tempList.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tempList.separatorColor = UIColor.white
        tempList.tableFooterView = UIView.init()
        return tempList
    }()

}
