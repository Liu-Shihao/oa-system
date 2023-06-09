<template>
  <div class="app-container">
    <el-calendar :first-day-of-week="7" ref="calendar">
      <template slot="dateCell" slot-scope="{ date, data }">
        <div>
          <p
            :class="[
              data.isSelected ? 'is-selected' : '',
              isWeekend(date) ? 'is-weekend' : '',
            ]"
          >
            {{ data.day.split("-").slice(1).join("-") }}
            <!-- {{ data.isSelected ? "✔️" : "" }} -->
            <el-button
              v-show="formatDate(date) === formatDate(new Date())"
              :type="isWork ? 'success' : 'primary'"
              icon="el-icon-check"
              circle
              @click="getAttendance()"
            ></el-button>
          </p>
          <div v-show="formatDate(date) < formatDate(new Date())">
            <span v-if="getStatuses(date).includes(1)">
              <p class="success">
                出勤状态：正常
                <i class="el-icon-s-claim"></i>
              </p>
            </span>
            <span v-else-if="getStatuses(date).includes(2)">
              <p class="warning">
                出勤状态：迟到
                <i class="el-icon-warning-outline"></i>
              </p>
            </span>
            <span v-else-if="getStatuses(date).includes(3)">
              <p class="warning">
                出勤状态：早退
                <i class="el-icon-warning-outline"></i>
              </p>
            </span>
            <span v-else-if="getStatuses(date).includes(4)">
              <p class="is-selected">
                出勤状态：请假
                <i class="el-icon-s-promotion"></i>
              </p>
            </span>
            <span v-else-if="getStatuses(date).includes(5)">
              <p class="danger">
                出勤状态：迟到 & 早退
                <i class="el-icon-warning"></i>
              </p>
            </span>
            <span v-else>
              <span v-show="!isWeekend(date)">
                <p class="info">
                  出勤状态：缺勤
                  <i class="el-icon-question"></i>
                </p>
              </span>
            </span>
          </div>
        </div>
      </template>
    </el-calendar>
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

        <el-button
          type="warning"
          icon="el-icon-s-promotion"
          size="mini"
          @click="handleLeave"
          >请假</el-button
        >
      </el-form-item>
    </el-form>

    <el-table
      v-if="refreshTable"
      v-loading="loading"
      :data="attendanceList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="35" align="center" />
      <el-table-column label="用户名称" align="center" prop="userName" />

      <el-table-column prop="attendanceType" label="出勤类型" width="80">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.sys_attendance_type"
            :value="scope.row.attendanceType"
          />
        </template>
      </el-table-column>

      <el-table-column prop="status" label="出勤状态" width="100">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.sys_attendance_status"
            :value="scope.row.status"
          />
        </template>
      </el-table-column>

      <el-table-column
        label="上班打卡时间"
        align="center"
        prop="onLine"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.onLine) }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="下班打卡时间"
        align="center"
        prop="offLine"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.offLine) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="工时" align="center" prop="duration" />
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

    <el-dialog
      :title="title"
      :visible.sync="leaveFormOpen"
      width="500px"
      append-to-body
    >
      <el-form ref="leaveForm" :model="leaveForm" label-width="80px">
        <el-form-item label="可用年假">{{ three }} 天</el-form-item>
        <el-form-item label="可用事假">{{ one }} 天</el-form-item>
        <el-form-item label="可用病假">{{ two }} 天</el-form-item>
        <el-form-item label="请假类型" >
        <el-select
          v-model="leaveForm.leaveType"
          placeholder="请假类型"
          clearable
        >
          <el-option
            v-for="dict in dict.type.sys_limit_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
        <el-form-item label="请假时间">
          <el-date-picker
            v-model="leaveDateRange"
            style="width: 240px"
            value-format="yyyy-MM-dd"
            type="daterange"
            range-separator="-"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="请假理由" prop="leaveReason">
          <el-input
            v-model="leaveForm.leaveReason"
            type="textarea"
            placeholder="请输入内容"
          />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitLeaveForm">确 定</el-button>
        <el-button @click="cancelLeave">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listAttendance,
  attendance,
  findUserCurrentMonthAttendanceStatus,
  findUserCurrentDayAttendanceRecord,
  leave,
} from "@/api/system/attendance";

import { holidayBalance } from "@/api/system/limit";

export default {
  name: "Calendar",
  dicts: ["sys_attendance_type", "sys_attendance_status", "sys_limit_type"],

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
      isWork: false,
      // 总条数
      total: 0,
      // 考勤表格数据
      attendanceList: [],
      // 弹出层标题
      title: "",
      // 日期范围
      dateRange: [],
      leaveDateRange: [],
      // 是否显示弹出层
      open: false,
      leaveFormOpen: false,
      refreshTable: true,
      one:0,
      two:0,
      three:0,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userName: undefined,
        status: undefined,
        attendanceType: undefined,
        onLine: undefined,
        offLine: undefined,
        duration: undefined,
      },
      // 表单参数
      form: {},
      leaveForm: {},
      holidayBalanceForm: {},
      calendarData: [],
      queryDateStatus: {
        currentDate: undefined,
        isPre: undefined,
      },
    };
  },

  mounted() {
    this.$nextTick(() => {
      const calendar = this.$refs.calendar;
      const devElement = calendar.$el.querySelector(".el-calendar__title");
      var text = "title";
      if (devElement) {
        text = devElement.textContent.trim();
        console.log("calendar__title", text); // 输出 "这是标题"
      }

      const spanElement = calendar.$el.querySelector("span");
      if (spanElement && spanElement.textContent.trim() === "上个月") {
        spanElement.addEventListener("click", () => {
          // 处理点击事件的逻辑
          console.log("点击上个月,当前时间为：", text);
          this.queryDateStatus = {
            currentDate: text,
            isPre: true,
          };
          this.getcalendarData(this.queryDateStatus);
        });
      }
    });
  },
  created() {
    this.getList();
    this.queryDateStatus = {
      currentDate: this.formatDate(new Date()),
      isPre: false,
    };
    this.getcalendarData(this.queryDateStatus);
    this.form = {
      userName: undefined,
      status: undefined,
      attendanceType: undefined,
    };
    this.hasRecord();
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
    getcalendarData(data) {
      findUserCurrentMonthAttendanceStatus(data).then((response) => {
        this.calendarData = [...this.calendarData, ...response.data];
        // const uniqueArr = Array.from(new Set(this.calendarData));
        // this.calendarData = uniqueArr
      });
    },
    hasRecord() {
      findUserCurrentDayAttendanceRecord().then((response) => {
        console.log("response.data:", response.data);
        this.isWork = response.data === 1;
      });
    },
    getAttendance() {
      attendance(this.form).then((response) => {
        if (response.code === 200) {
          this.$alert("<font color='red'>打卡成功 </font>", "系统提示", {
            dangerouslyUseHTMLString: true,
            type: "success",
          });
          this.isWork = true;
          this.getList();
        } else {
          this.$alert("<font color='red'>网络错误 </font>", "系统提示", {
            dangerouslyUseHTMLString: true,
            type: "error",
          });
        }
      });
    },

    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    cancelLeave() {
      this.leaveFormOpen = false;
      this.resetLeaveForm();
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
    resetLeaveForm() {
      this.leaveForm = {
        leaveReason: undefined,
      };
      (this.leaveDateRange = []), this.resetForm("leaveForm");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },

    handleLeave() {
      holidayBalance().then((response) => {
        if (response.code === 200) {
          this.title = "请假";
          this.leaveFormOpen = true;
          this.one = response.data.one === undefined ? 0 : response.data.one;
          this.two = response.data.two === undefined ? 0 : response.data.two;
          this.three = response.data.three === undefined ? 0 : response.data.three;
          
          this.getList();
        } else {

        }
        this.resetLeaveForm();
      });
    },
    /** 重置按钮操作 */
    resetQuery() {
      (this.dateRange = []), this.resetForm("queryForm");
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
    submitLeaveForm: function () {
      this.$refs["leaveForm"].validate((valid) => {
        if (valid) {
          leave(this.addDateRange(this.leaveForm, this.leaveDateRange)).then(
            (response) => {
              if (response.code === 200) {
                this.$alert("<font color='red'>请假成功 </font>", "系统提示", {
                  dangerouslyUseHTMLString: true,
                  type: "success",
                });
                this.getList();
              } else {
                this.$alert("<font color='red'>网络错误 </font>", "系统提示", {
                  dangerouslyUseHTMLString: true,
                  type: "error",
                });
              }
            }
          );
          this.leaveFormOpen = false;
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

    getStatuses(date) {
      return this.calendarData.map((item) => {
        const itemCreateTime = this.formatDate(new Date(item.createTime));
        if (itemCreateTime === this.formatDate(date)) {
          // console.log("查询到考勤信息:", itemCreateTime, item.status,typeof(item.status));
          return parseInt(item.status);
        }
        return 0;
      });
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
    isWeekend(date) {
      return date.getDay() === 0 || date.getDay() === 6 ? true : false;
    },
  },
};
</script>

<style scoped>
.is-selected {
  color: #1989fa;
}
.is-weekend {
  color: #c0c4cc;
}
.success {
  color: #67c23a;
}
.warning {
  color: #e6a23c;
}
.danger {
  color: #f56c6c;
}
.info {
  color: #909399;
}
</style>