<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="用户名称" prop="userName">
        <el-input
          v-model="queryParams.userName"
          placeholder="请输入用户名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="出勤状态" prop="status">
        <el-select
          v-model="queryParams.status"
          placeholder="出勤状态"
          clearable
        >
          <el-option
            v-for="dict in dict.type.sys_attendance_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="出勤类型" prop="attendanceType">
        <el-select
          v-model="queryParams.attendanceType"
          placeholder="出勤类型"
          clearable
        >
          <el-option
            v-for="dict in dict.type.sys_attendance_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="创建时间">
        <el-date-picker
          v-model="dateRange"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          icon="el-icon-search"
          size="mini"
          @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery"
          >重置</el-button
        >
      </el-form-item>
    </el-form>

    <el-table
      v-loading="loading"
      :data="attendanceList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="用户名称" align="center" prop="userName" />
      <el-table-column label="出勤状态" align="center" prop="status" />
      <el-table-column label="出勤类型" align="center" prop="attendanceType" />
      <el-table-column
        label="创建时间"
        align="center"
        prop="createTime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <el-calendar :first-day-of-week="7">
      <template slot="dateCell" slot-scope="{ date, data }">
        <p :class="data.isSelected ? 'is-selected' : ''">
          {{ data.day.split("-").slice(1).join("-") }}
          {{ data.isSelected ? "✔️" : "" }}
          <span v-if="hasData(date)">
          <p class="success">
            {{ getData(date).text }}
        </p>
            
            <i class="el-icon-platform-eleme"></i>
          </span>
        </p>

      
      </template>
    </el-calendar>

  
  </div>
</template>

<script>
import { listAttendance, attendance,findUserCurrentMonthAttendanceStatus } from "@/api/system/attendance";
export default {
  name: "Calendar",
  dicts: ["sys_attendance_type", "sys_attendance_status"],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 考勤表格数据
      attendanceList: [],
      // 弹出层标题
      title: "",
      // 日期范围
      dateRange: [],
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userName: undefined,
        status: undefined,
        attendanceType: undefined,
      },
      // 表单参数
      form: {},
      calendarData: [],
    };
  },
  created() {
    this.getList();
    this.getcalendarData();
  },
  methods: {
    /** 查询考勤列表 */
    getList() {
      this.loading = true;
      listAttendance(this.addDateRange(this.queryParams, this.dateRange)).then(
        (response) => {
          this.attendanceList = response.rows;
          this.total = response.total;
          this.loading = false;
        }
      );
    },
    getcalendarData(){
      findUserCurrentMonthAttendanceStatus().then(
        (response) => {
          console.log('@@@',response.data)
          this.calendarData = response.data;
          
        }
      );
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        userName: undefined,
        status: undefined,
        attendanceType: undefined,
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.postId);
      this.single = selection.length != 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加岗位";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const postId = row.postId || this.ids;
      getPost(postId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改岗位";
      });
    },
    /** 提交按钮 */
    submitForm: function () {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.postId != undefined) {
            updatePost(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPost(this.form).then((response) => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const postIds = row.postId || this.ids;
      this.$modal
        .confirm('是否确认删除岗位编号为"' + postIds + '"的数据项？')
        .then(function () {
          return delPost(postIds);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "system/post/export",
        {
          ...this.queryParams,
        },
        `post_${new Date().getTime()}.xlsx`
      );
    },
    hasData(date) {
      return this.calendarData.some(
        (item) => item.date === this.formatDate(date)
      );
    },
    getData(date) {
      return this.calendarData.find(
        (item) => item.date === this.formatDate(date)
      );
    },
    formatDate(date) {
      const year = date.getFullYear();
      const month = (date.getMonth() + 1).toString().padStart(2, "0");
      const day = date.getDate().toString().padStart(2, "0");
      return `${year}-${month}-${day}`;
    },
  },
};
</script>

<style scoped>
.is-selected {
  color: #1989fa;
}
.success {
  color: #67C23A;
}
.warning {
  color: #E6A23C;
}
.danger {
  color: #F56C6C;
}
.info {
  color: #909399;
}

</style>