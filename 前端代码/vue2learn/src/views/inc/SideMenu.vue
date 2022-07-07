<template>
	<el-row class="tac">
	<el-menu
			class="el-menu-vertical-demo"
			background-color="#545c64"
			text-color="#fff"
			active-text-color="#ffd04b">

		<router-link to="/navigate">
			<el-menu-item index="Index"  >
				<template slot="title">
					<i class="el-icon-s-home"></i>
					<span slot="title" >首页</span>
				</template>
			</el-menu-item>
		</router-link>

		<!--<el-submenu :index="menu.name" v-for="menu in menuList">
			<template slot="title">
				<i :class="menu.icon"></i>
				<span>{{menu.title}}</span>
			</template>

			<router-link :to="item.path" v-for="item in menu.children">
				<el-menu-item :index="item.name" @click="selectMenu(item)">
					<template slot="title">
						<i :class="item.icon"></i>
						<span slot="title">{{item.title}}</span>
					</template>
				</el-menu-item>
			</router-link>

		</el-submenu>-->
		<el-submenu index="1">
			<template slot="title">
				<i class="el-icon-location"></i>
				<span>学生信息管理</span>
			</template>
			<el-submenu index="1-1">
				<template slot="title">学习管理</template>
				<el-menu-item index="1-1-1">学费充值</el-menu-item>
				<el-menu-item index="1-1-2">校园卡充值</el-menu-item>
				<el-menu-item index="1-1-3">宿舍缴费</el-menu-item>
			</el-submenu>
			<el-submenu index="1-2">
				<template slot="title">生活管理</template>
				<el-menu-item index="1-2-1">学费充值</el-menu-item>
				<el-menu-item index="1-2-2">校园卡充值</el-menu-item>
				<el-menu-item index="1-2-3">宿舍缴费</el-menu-item>
			</el-submenu>
		</el-submenu>
		<el-submenu index="1">
			<template slot="title">
				<i class="el-icon-location"></i>
				<span>学校信息查询</span>
			</template>
			<el-submenu index="1-1">
				<template slot="title">教学查询</template>
				<el-menu-item index="1-1-1">学费充值</el-menu-item>
				<el-menu-item index="1-1-2">校园卡充值</el-menu-item>
				<el-menu-item index="1-1-3">宿舍缴费</el-menu-item>
			</el-submenu>
			<el-submenu index="1-2">
				<template slot="title">日常生活</template>
				<el-menu-item index="1-2-1">学费充值</el-menu-item>
				<el-menu-item index="1-2-2">校园卡充值</el-menu-item>
				<el-menu-item index="1-2-3">宿舍缴费</el-menu-item>
			</el-submenu>
		</el-submenu>


	</el-menu>
	</el-row>
</template>

<script>
	export default {
		name: "SideMenu",
		data() {
			return {

			}
		}
	}
</script>

<style scoped>
	.el-menu-vertical-demo {
		height: 100%;
	}
</style>
