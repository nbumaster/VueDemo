const getters = {
  sidebar: state => state.app.sidebar,
  device: state => state.app.device,
  token: state => state.user.token,
  avatar: state => state.user.avatar,
  name: state => state.user.name,
  visitedViews: state => state.tagsView.visitedViews, // 新增顶部标签栏
  cachedViews: state => state.tagsView.cachedViews,   // 新增顶部标签栏
  avatar: state => state.user.avatar,
  menuList: state => state.menu.menuList,
}
export default getters
