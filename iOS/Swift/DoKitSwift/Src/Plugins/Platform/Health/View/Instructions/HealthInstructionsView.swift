//
//  HealthInstructionsView.swift
//  DoraemonKit-Swift
//
//  Created by 李盛安 on 2020/6/15.
//

import UIKit

class HealthInstructionsView: UIView {

    var cellHeight: CGFloat = 0.0
    var tableView = UITableView()
    var itemTitleArray = [String]()
    let DoraemonHealthInstructionsCellID = "DoraemonHealthInstructionsCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let bg_y = kSizeFrom750_Landscape(89)
        itemTitleArray = [
            "点击开始体检按钮开始本次的性能数据手机。",
            "在每一个页面至少停留10秒钟，如果低于10秒钟的话，我们将会丢弃该页面的收集数据。",
            "测试完毕之后，重新进入该页面，点击结束测试按钮，填写本次的测试用例名称和测试人的名字，即可上传。",
            "打开dokit.cn平台，进入app健康体检列表，查看本次的数据报告。"
        ];
        
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: bg_y, width: self.width, height: self.height))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.backgroundColor = UIColor.yellow
        tableView.register(HealthInstructionsCell.self, forCellReuseIdentifier: DoraemonHealthInstructionsCellID)
        self.addSubview(tableView)
        
        cellHeight = kSizeFrom750_Landscape(104)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension HealthInstructionsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DoraemonHealthInstructionsCellID) as! HealthInstructionsCell
        let title = LocalizedString("第\(indexPath.row + 1)步")
        cellHeight = cell.renderUI(title: title, itemLabel: itemTitleArray[indexPath.section])
        return cell
    }
}
