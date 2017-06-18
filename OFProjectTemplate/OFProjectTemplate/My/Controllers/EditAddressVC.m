//
//  EditAddressVC.m
//  OFProjectTemplate
//
//  Created by wangdongwen on 2017/6/14.
//  Copyright © 2017年 com.oriental-finance.ios. All rights reserved.
//

#import "EditAddressVC.h"
#import "EditAddressCell.h"
#import "Masonry.h"
#import "OFUIkitMacro.h"
#import "ZHPickView.h"
//#import "AddressPickerView.h"
#import "MacroMy.h"
#import "AreaModel.h"
#import "CityModel.h"
#import "ProvinceModel.h"


@interface EditAddressVC ()<UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIPickerView *_pickerView;
    NSDictionary *_areaDic;
    NSMutableArray *_provinceArr;
    UIView *pickBack;
    UIButton *cancelBtn;
    UIButton *sureBtn;
    NSInteger regioncode;
    
    
}


//@property (nonatomic ,strong) AddressPickerView * pickerView;

@end

@implementation EditAddressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationBar];
    [self.view addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 111.5, 0));
    }];
    
    UIButton *outLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    outLoginBtn.layer.cornerRadius = 22;
    [outLoginBtn setTitle:@"删除地址" forState:UIControlStateNormal];
    outLoginBtn.titleLabel.font = UIFontMake(16);
    [outLoginBtn setTitleColor:UIColorMake(51, 51, 51) forState:UIControlStateNormal];
    outLoginBtn.backgroundColor = UIColorMake(216, 216, 213);
    [outLoginBtn addTarget:self action:@selector(clientAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:outLoginBtn];
    
    [outLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.listTableView.mas_bottom).offset(30.5);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@150);
        make.height.equalTo(@44);
    }];
//    [self.view addSubview:self.pickerView];
    [self loading];
}

- (void)clientAction {
    [self back];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 3){
        return 57.5;
    } else{
        return 48.5;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellid = [NSString stringWithFormat:@"cellid%ld",indexPath.row];
    EditAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell = [[EditAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
            
        }
        if (indexPath.row == 0) {
            cell.titleLabel.text = @"收货人";
            cell.textsLabel.placeholder = @"输入收货人姓名";
        } else if (indexPath.row == 1) {
            cell.titleLabel.text = @"联系电话";
            cell.textsLabel.placeholder = @"输入电话号码";
        } else if (indexPath.row == 2) {
            cell.titleLabel.text = @"所在地区";
            cell.textsLabel.placeholder = @"请选择地区";
            cell.textsLabel.userInteractionEnabled = NO;
        } else if (indexPath.row == 3) {
            cell.titleLabel.text = @"详细地址";
            cell.textsLabel.text = @"请填写详细地址";
            
            UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 48.5, SCREEN_WIDTH, 10)];
            line.backgroundColor = UIColorMake(236, 236, 236);
            [cell.contentView addSubview:line];
            [cell.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(cell.contentView).offset(-5);
                make.left.equalTo(cell.contentView.mas_left).offset(22.5);
            }];
            cell.separatorInset = UIEdgeInsetsMake(0, SCREEN_WIDTH, 0, 0); // ViewWidth  [宏] 指的是手机屏幕的宽度
        } else if (indexPath.row == 4) {
            cell.titleLabel.text = @"设为默认";
            [cell.textsLabel setHidden:YES];
            [cell.pushSwich setHidden:NO];
        }
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    EditAddressCell *cell = [self.listTableView cellForRowAtIndexPath:indexPath];
    
    if (indexPath.row == 2){
//        [self.pickerView show];
        [self uiConfig];
    }
}
- (void)initNavigationBar {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 50, 25);
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [btn setTitle:@"保存" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *buttonItem2 = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *negativeSeperator2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator2.width = -5;
    self.navigationItem.rightBarButtonItems = @[negativeSeperator2, buttonItem2];
    
}



- (UITableView *)listTableView{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc]init];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.separatorColor = UIColorMake(204, 204, 204);
        _listTableView.scrollEnabled = NO;
        _listTableView.tableFooterView = [[UIView alloc]init];
        
    }
    
    return _listTableView;
}
- (void)loading
{
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(globalQueue, ^{
        [self prepareData];
        dispatch_queue_t mainQueue = dispatch_get_main_queue();
        dispatch_async(mainQueue, ^{
            
        });
        
    });
}
- (void)prepareData
{
    //area.plist是字典
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"area" ofType:@"plist"];
    _areaDic = [[NSDictionary alloc]initWithContentsOfFile:plistPath];
    
    //city.plist是数组
    NSString *plist = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"];
    NSMutableArray *dataCity = [[NSMutableArray alloc] initWithContentsOfFile:plist];
    
    _provinceArr = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in dataCity) {
        ProvinceModel *model  = [[ProvinceModel alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        model.citiesArr = [[NSMutableArray alloc]init];
        for (NSDictionary *dic in model.cities) {
            CityModel *cityModel = [[CityModel alloc]init];
            [cityModel setValuesForKeysWithDictionary:dic];
            [model.citiesArr addObject:cityModel];
        }
        [_provinceArr addObject:model];
    }
    
}
- (void)uiConfig
{
    pickBack = [[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-275, [UIScreen mainScreen].bounds.size.width, 300)];
    pickBack.backgroundColor = UIColorMake(230, 230, 230);
    [self.view addSubview:pickBack];
   
    //picker view 有默认高度216
    _pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, 216)];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    [_pickerView selectRow:0 inComponent:0 animated:YES];
    [pickBack addSubview:_pickerView];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    view.backgroundColor = UIColorMake(204, 204, 204);
    [pickBack addSubview:view];
    cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(0, 0, 60, 30);
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cancelBtn.titleLabel.font =UIFontMake(14);
    [cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:cancelBtn];
    sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(SCREEN_WIDTH-60, 0, 60, 30);
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    sureBtn.titleLabel.font =UIFontMake(14);
    [sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:sureBtn];
}
-(void)cancelBtnClick{
    [pickBack removeFromSuperview];
}

-(void)sureBtnClick{
    NSLog(@"%@",self.regionCode);
    [pickBack removeFromSuperview];
}

- (void)saveAction{
    NSIndexPath  *indxpath = [NSIndexPath indexPathForRow:0 inSection:0];
    EditAddressCell *cell = [self.listTableView cellForRowAtIndexPath:indxpath];
    NSIndexPath  *indxpath1 = [NSIndexPath indexPathForRow:1 inSection:0];
    EditAddressCell *cell1 = [self.listTableView cellForRowAtIndexPath:indxpath1];
    NSIndexPath  *indxpath2 = [NSIndexPath indexPathForRow:2 inSection:0];
    EditAddressCell *cell2 = [self.listTableView cellForRowAtIndexPath:indxpath2];
    NSIndexPath  *indxpath3 = [NSIndexPath indexPathForRow:3 inSection:0];
    EditAddressCell *cell3 = [self.listTableView cellForRowAtIndexPath:indxpath3];
    NSDictionary *dic = @{@"uname":cell.textsLabel.text, @"phone":cell1.textsLabel.text, @"zonecode":self.regionCode, @"zonename":cell2.textsLabel.text,@"addr":cell3.textsLabel.text, @"isdefault":@"0"};
    [[OrientalHttpManager sharedInstance] requestWithTarget:addMyAddr params:dic success:^(NSURLSessionDataTask *task, id responseObject, BOOL success) {
        if (success) {
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
            
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
    return 3;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (0 == component)
    {
        return _provinceArr.count;
    }
    else if(1==component)
    {
        NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        ProvinceModel *model =   _provinceArr[rowProvince];
        return model.citiesArr.count;
    }
    else
    {   NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        NSInteger rowCity = [pickerView selectedRowInComponent:1];
        ProvinceModel *model = _provinceArr[rowProvince];
        CityModel *cityModel = model.citiesArr[rowCity];
        NSString *str = [cityModel.code description];
        NSArray *arr =  _areaDic[str];
        return arr.count;
    }
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (0 == component)
    {
        ProvinceModel *model = _provinceArr[row];
        return model.name;
    }
    else if(1==component)
    {
        NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        ProvinceModel *model = _provinceArr[rowProvince];
        CityModel *cityModel = model.citiesArr[row];
        return cityModel.name;
    }else
    {
        NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        NSInteger rowCity = [pickerView selectedRowInComponent:1];
        ProvinceModel *model = _provinceArr[rowProvince];
        CityModel *cityModel = model.citiesArr[rowCity];
        NSString *str = [cityModel.code description];
        NSArray *arr = _areaDic[str];
        AreaModel *areaModel = [[AreaModel alloc]init];
        [areaModel setValuesForKeysWithDictionary:arr[row]];
        return areaModel.name;
    }
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(0 == component)
    {
        [pickerView reloadComponent:1];
        [pickerView reloadComponent:2];
        
    } if(1 == component)
    {
        [pickerView reloadComponent:2];
    }
    
    NSInteger selectOne = [pickerView selectedRowInComponent:0];
    NSInteger selectTwo = [pickerView selectedRowInComponent:1];
    NSInteger selectThree = [pickerView selectedRowInComponent:2];
    
    ProvinceModel *model = _provinceArr[selectOne];
    CityModel *cityModel = model.citiesArr[selectTwo];
    NSString *str = [cityModel.code description];
    NSArray *arr = _areaDic[str];
    AreaModel *areaModel = [[AreaModel alloc]init];
    [areaModel setValuesForKeysWithDictionary:arr[selectThree]];
    NSLog(@"省:%@ 市:%@ 区:%@",model.name,cityModel.name,areaModel.name);
    NSLog(@"省:%@ 市:%@ 区:%@",model.code,cityModel.code,areaModel.code);
    NSIndexPath  *indxpath = [NSIndexPath indexPathForRow:2 inSection:0];
    EditAddressCell *cell = [self.listTableView cellForRowAtIndexPath:indxpath];
    cell.textsLabel.text = [NSString stringWithFormat:@"%@ %@ %@",model.name,cityModel.name,areaModel.name];
    self.regionCode = [NSString stringWithFormat:@"%@",areaModel.code];
}











/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
