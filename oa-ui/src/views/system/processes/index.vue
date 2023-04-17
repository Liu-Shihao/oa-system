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
      <el-form-item label="流程名称" prop="processesTitle">
        <el-input
          v-model="queryParams.processesTitle"
          placeholder="请输入流程名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="流程描述" prop="processesDescription">
        <el-input
          v-model="queryParams.processesDescription"
          placeholder="请输入流程描述"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <!-- <el-form-item label="创建人" prop="createBy">
        <el-input
          v-model="queryParams.createBy"
          placeholder="创建人"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->
      <el-form-item label="流程状态" prop="processesStatus">
        <el-select
          v-model="queryParams.processesStatus"
          placeholder="流程状态"
          clearable
        >
          <el-option
            v-for="dict in dict.type.sys_timeline_status"
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

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:processes:add']"
          >新增</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:processes:edit']"
          >修改</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:processes:remove']"
          >删除</el-button
        >
      </el-col>

      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="processesList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="流程编号" align="center" prop="processesId" />
      <el-table-column label="流程名称" align="center" prop="processesTitle" />
      <el-table-column
        label="流程描述"
        align="center"
        prop="processesDescription"
      />

      <el-table-column label="创建人" align="center" prop="createBy" />
      <el-table-column label="审批人" align="center" prop="approverUser" />
      <el-table-column label="状态" align="center" prop="processesStatus">
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.sys_timeline_status"
            :value="scope.row.processesStatus"
          />
        </template>
      </el-table-column>
      <el-table-column label="审批意见" align="center" prop="approvalOpinion" />
      <el-table-column
        label="审批时间"
        align="center"
        prop="approvalTime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.approvalTime) }}</span>
        </template>
      </el-table-column>


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
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <!-- <el-button
            size="mini"
            type="text"
            icon="el-icon-chat-dot-square"
            @click="addStep(scope.row)"
            v-hasPermi="['system:steps:add']"
            >添加步骤</el-button
          > -->

          <el-button
            v-show="userName === scope.row.approverUser"
            size="mini"
            type="text"
            icon="el-icon-chat-dot-square"
            @click="approve(scope.row)"
            >审批</el-button
          >
          <!-- <el-button
            size="mini"
            type="text"
            icon="el-icon-thumb"
            @click="handleLook(scope.row)"
            >详情</el-button
          > -->

          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:processes:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:processes:remove']"
            >删除</el-button
          >
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

    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="流程名称" prop="processesTitle">
          <el-input
            v-model="form.processesTitle"
            placeholder="请输入流程名称"
          />
        </el-form-item>
        <el-form-item label="流程描述" prop="processesDescription">
          <el-input
            v-model="form.processesDescription"
            placeholder="请输入流程描述"
          />
        </el-form-item>
        <el-form-item label="审批人" prop="approverUser">
          <el-input v-model="form.approverUser" placeholder="请输入审批人" />
        </el-form-item>

        <!-- <el-form-item label="状态">
          <el-radio-group v-model="form.processesStatus">
            <el-radio
              v-for="dict in dict.type.sys_timeline_status"
              :key="dict.value"
              :label="dict.value"
              >{{ dict.label }}</el-radio
            >
          </el-radio-group>
        </el-form-item> -->
      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <el-dialog
      :title="title"
      :visible.sync="openAddStep"
      width="500px"
      append-to-body
    >
      <el-form
        ref="stepForm"
        :model="stepForm"
        :rules="stepRules"
        label-width="100px"
      >
        <el-form-item label="流程编号" prop="processesId">
          <el-input v-model="stepForm.processesId" :disabled="true"></el-input>
        </el-form-item>
        <el-form-item label="步骤名称" prop="stepsTitle">
          <el-input
            v-model="stepForm.stepsTitle"
            placeholder="请输入步骤名称"
          />
        </el-form-item>
        <el-form-item label="步骤描述" prop="stepsDescription">
          <el-input
            v-model="stepForm.stepsDescription"
            type="textarea"
            placeholder="请输入步骤描述"
          />
        </el-form-item>
        <el-form-item label="负责人" prop="approverUser">
          <el-input
            v-model="stepForm.approverUser"
            placeholder="请输入审批人"
          />
        </el-form-item>

        <el-form-item label="状态">
          <el-radio-group v-model="stepForm.stepsStatus">
            <el-radio
              v-for="dict in dict.type.sys_timeline_status"
              :key="dict.value"
              :label="dict.value"
              >{{ dict.label }}</el-radio
            >
          </el-radio-group>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitStepForm">确 定</el-button>
        <el-button @click="cancelAddStep">取 消</el-button>
      </div>
    </el-dialog>
    <br />

    <el-dialog :visible.sync="approval"  title="审批">
      <el-form ref="form" :model="form" :rules="rules">
        <el-form-item label="流程名称" prop="processesTitle">
          <el-input v-model="form.processesTitle" :disabled="true" />
        </el-form-item>
        <el-form-item label="流程描述" prop="processesDescription">
          <el-input v-model="form.processesDescription" :disabled="true" />
        </el-form-item>
        <el-form-item label="创建人" prop="createBy">
          <el-input v-model="form.createBy" :disabled="true" />
        </el-form-item>
        <el-form-item label="审批人" prop="approverUser">
          <el-input v-model="form.approverUser" placeholder="请输入审批人" />
        </el-form-item>
        <el-form-item label="审批意见" prop="approvalOpinion">
          <el-input
            v-model="form.approvalOpinion"
            placeholder="请输入审批意见"
          />
        </el-form-item>

        <!-- <el-form-item label="状态">
          <el-radio-group v-model="form.processesStatus">
            <el-radio
              v-for="dict in dict.type.sys_timeline_status"
              :key="dict.value"
              :label="dict.value"
              >{{ dict.label }}</el-radio
            >
          </el-radio-group>
        </el-form-item> -->

        <el-form-item label="审批结果" prop="processesStatus">
          <el-radio-group v-model="form.processesStatus">
            <el-radio label="0">同意</el-radio>
            <el-radio label="2">驳回</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancelApproval">取消</el-button>
        <el-button type="primary" @click="submitApproval">确定</el-button>
      </div>
    </el-dialog>

    <!-- <div class="block">
      <el-timeline>
        <el-timeline-item
          v-for="(item, index) in stepData"
          :key="index"
          :timestamp="item.createTime"
          placement="top"
        >
          <el-card>
            <h4>{{ item.stepsTitle }}</h4>
            <h5>{{ item.stepsDescription }}</h5>
            <p>
              {{ item.approverUser }} 提交于{{ parseTime(item.createTime) }}
            </p>
          </el-card>
        </el-timeline-item>
      </el-timeline>
    </div> -->
  </div>
</template>
  
  <script>
import {
  listProcesses,
  addProcesses,
  addProcessesSteps,
  editProcessesSteps,
  editProcesses,
  deleteProcesses,
} from "@/api/system/processes";

export default {
  name: "Processes",
  dicts: ["sys_timeline_status"],
  data() {
    return {
      reverse: true,
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
      // 流程表格数据
      processesList: [],
      stepData: [],
      // 日期范围
      dateRange: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否显示弹出层
      openAddStep: false,
      approval: false,
      // 是否显示弹出层
      isShowSteps: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        processesTitle: undefined,
        processesDescription: undefined,
        createBy: undefined,
        processesStatus: undefined,
      },
      stepsForm: {},
      // 表单参数
      form: {},
      stepForm: {},
      approvalForm: {},
      // 表单校验
      rules: {
        processesTitle: [
          { required: true, message: "流程名称不能为空", trigger: "blur" },
        ],
        processesDescription: [
          { required: true, message: "流程内容不能为空", trigger: "blur" },
        ],
        createBy: [
          { required: true, message: "创建人不能为空", trigger: "blur" },
        ],
      },

      stepRules: {
        stepsTitle: [
          { required: true, message: "步骤名称不能为空", trigger: "blur" },
        ],
        stepsDescription: [
          { required: true, message: "步骤描述不能为空", trigger: "blur" },
        ],
        approverUser: [
          { required: true, message: "审批人不能为空", trigger: "blur" },
        ],
      },
    };
  },
  computed: {
    userName() {
      return this.$store.getters["name"];
    },
  },

  created() {
    this.getList();
  },
  methods: {
    /** 查询列表 */
    getList() {
      this.loading = true;
      listProcesses(this.addDateRange(this.queryParams, this.dateRange)).then(
        (response) => {
          this.processesList = response.rows;
          this.total = response.total;
          this.loading = false;
        }
      );
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },

    cancelAddStep() {
      this.openAddStep = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        processesTitle: undefined,
        processesDescription: undefined,
        createBy: undefined,
        processesStatus: undefined,
      };
      this.resetForm("form");
    },
    resetStep() {
      this.stepForm = {
        processesId: undefined,
        stepsTitle: undefined,
        stepsDescription: undefined,
        approverUser: undefined,
        stepsStatus: undefined,
      };
      this.resetForm("stepForm");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      (this.dateRange = []), this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.processesId);
      this.single = selection.length != 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加流程";
    },
    addStep(row) {
      this.stepForm = {
        processesId: row.processesId,
      };
      this.openAddStep = true;
      this.title = "添加流程步骤";
    },
    approve(row) {
      this.form = {
        processesId: row.processesId,
        processesTitle: row.processesTitle,
        processesDescription: row.processesDescription,
        createBy: row.createBy,
        approverUser: row.approverUser,
        processesStatus: row.processesStatus,
        approvalOpinion: row.approvalOpinion,
        approvalTime: row.approvalTime,
        delFlag: row.delFlag,
        createTime: row.createTime,
        updateTime: row.updateTime,
      };
      this.approval = true;
    },
    cancelApproval() {
      this.form = {};
      this.approval = false;
    },
    submitApproval() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          editProcesses(this.form).then((response) => {
            this.$modal.msgSuccess("审批成功");
            this.approval = false;
            this.getList();
          });
        }
      });
    },

    handleLook(row) {
      this.stepData = row.steps;
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.form = {
        processesId: row.processesId,
        processesTitle: row.processesTitle,
        processesDescription: row.processesDescription,
        createBy: row.createBy,
        approverUser: row.approverUser,
        approvalOpinion: row.approvalOpinion,
        approvalTime: row.approvalTime,
        delFlag: row.delFlag,
        createTime: row.createTime,
        updateTime: row.updateTime,
      };
      this.open = true;
      this.title = "编辑流程";
    },
    /** 提交按钮 */
    submitForm: function () {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.processesId != undefined) {
            editProcesses(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addProcesses(this.form).then((response) => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    submitStepForm: function () {
      this.$refs["stepForm"].validate((valid) => {
        if (valid) {
          if (this.stepForm.stepsId != undefined) {
            editProcessesSteps(this.stepForm).then((response) => {
              this.$modal.msgSuccess("修改步骤成功");
              this.openAddStep = false;
              this.getList();
            });
          } else {
            addProcessesSteps(this.stepForm).then((response) => {
              this.$modal.msgSuccess("新增步骤成功");
              this.openAddStep = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const processesId = row.processesId || this.ids;
      this.$modal
        .confirm('是否确认删除岗位编号为"' + processesId + '"的数据项？')
        .then(function () {
          return deleteProcesses(processesId);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
  },
};
</script>
  
  