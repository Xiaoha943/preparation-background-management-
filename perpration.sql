--create table ytz6 select zi,nr from ytz5 group by zi,nr order by id asc
--create table yiti2 select * from yitizi group by zi order by id asc

省
CREATE TABLE `province`(
    `id` INT(11) AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(30)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

城市
CREATE TABLE `cites`(
    `id` INT(11) AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(30),
    `province_id` INT(11),
    FOREIGN KEY (province_id) REFERENCES province(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

地区
CREATE TABLE `areas`(
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(30),
    `city_id` INT(11),
    FOREIGN KEY (city_id) REFERENCES cites(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

部门
CREATE TABLE `dict_departments`(
    `departments_id` INT(11) AUTO_INCREMENT PRIMARY KEY,
    `departments_name` VARCHAR(30) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

中心
CREATE TABLE `dict_center`(
    `center_id` INT(11) AUTO_INCREMENT PRIMARY KEY,
    `center_name` VARCHAR(30) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

团队
CREATE TABLE `dict_team`(
    `team_id` INT(11) AUTO_INCREMENT PRIMARY KEY,
    `team_name` VARCHAR(30) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

岗位
CREATE TABLE `dict_post`(
    `post_id` INT(11) AUTO_INCREMENT PRIMARY KEY,
    `post_name` VARCHAR(30) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

职级
CREATE TABLE `dict_rank`(
    `rank_id` INT(11) AUTO_INCREMENT PRIMARY KEY,
    `rank_name` VARCHAR(30) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


在编人数表
CREATE TABLE `incumbency`(
    `incumbency_id` INT(11) AUTO_INCREMENT PRIMARY KEY,
    `department_id` INT(11) NOT NULL,
    `center_id` INT(11) NOT NULL,
    `team_id` INT(11) NOT NULL,
    `post_id` INT(11) NOT NULL,
    `rank_id` INT(11) NOT NULL,
    `area_id` INT(11),
    `number_of_employe` INT(11),
    `create_time` DATE,
    FOREIGN KEY (department_id) REFERENCES dict_departments(departments_id),
    FOREIGN KEY (center_id) REFERENCES dict_center(center_id),
    FOREIGN KEY (team_id) REFERENCES dict_team(team_id),
    FOREIGN KEY (post_id) REFERENCES dict_post(post_id),
    FOREIGN KEY (rank_id) REFERENCES dict_rank(rank_id),
    FOREIGN KEY (area_id) REFERENCES areas(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;