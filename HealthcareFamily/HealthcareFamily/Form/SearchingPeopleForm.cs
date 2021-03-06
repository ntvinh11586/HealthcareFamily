﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using MetroFramework;
using MetroFramework.Forms;

using HealthcareFamilyGUI.FormArguments;
using HealthcareFamilyGUI.BUS_Webservice;

namespace HealthcareFamilyGUI
{
    public partial class SearchingPeopleForm : MetroForm
    {
        public SearchingPeopleForm()
        {
            InitializeComponent();
        }

        HF_BUS_WebserviceSoapClient bus = new HF_BUS_WebserviceSoapClient();
        public SearchingPeopleForm(SearchingPeopleFormArguments arg)
        {
            InitializeComponent();
            Arguments = arg;
        }

        private void cmdOk_Click(object sender, EventArgs e)
        {
            if (lvwPeopleList.SelectedItems.Count > 0)
            {
                this.Hide();

                string email = lvwPeopleList.SelectedItems[0].SubItems[1].Text;

                var arg = new SearchingRelationshipFormArguments();
                arg.Username = Arguments.Username;
                arg.FollowerEmail = email;
                var frm = new SearchingRelationshipForm(arg);


                if (frm.ShowDialog() == DialogResult.OK)
                {

                    string Relationship = frm.Relationship;

                    // database

                    // kiem tra da them follower chua

                    // add follower
                    bus.AddFollowerByEmail(Arguments.Username, email, Relationship);

                    // add sharing info
                    bus.SetSharingInfoByEmail(Arguments.Username, email, false);

                    MetroMessageBox.Show(this, "Add people success!", "Message",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);

                    this.Close();
                } else if (frm.DialogResult == DialogResult.Cancel || frm.DialogResult == DialogResult.Ignore)
                {
                    this.Show();
                }
            } else
            {
                MetroMessageBox.Show(this, "Please select a people!", "Error",
                MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void cmdCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void SearchingPeopleForm_Load(object sender, EventArgs e)
        {
            lvwPeopleList.View = View.Details;

            lvwPeopleList.Columns.Add("Name", 150, HorizontalAlignment.Left);
            lvwPeopleList.Columns.Add("Email", 200, HorizontalAlignment.Left);
        }

        private void cmdSearch_Click(object sender, EventArgs e)
        {
            string info = txtPeopleInfo.Text;

            if (info == "")
                return;

            List<UserDTO> list = new List<UserDTO>(bus.GetListUserNotFriend(Arguments.Username, info));

            // list view
            DataTable table = new DataTable();

            DataColumn countColumn = new DataColumn(
                "Name", Type.GetType("System.String"));
            table.Columns.Add(countColumn);

            DataColumn nameColumn = new DataColumn(
                "Email", Type.GetType("System.String"));
            table.Columns.Add(nameColumn);

            for (int i = 0; i < list.Count; i++)
            {
                DataRow r = table.NewRow();
                r["Name"] = list[i].Name;
                r["Email"] = list[i].Email;
                table.Rows.Add(r);
            }

            lvwPeopleList.Items.Clear();

            lvwPeopleList.FullRowSelect = true;

            foreach (DataRow row in table.Rows)
            {
                ListViewItem item = new ListViewItem(row["Name"].ToString());
                item.SubItems.Add(row["Email"].ToString());
                lvwPeopleList.Items.Add(item); //Add this row to the ListView
            }
        }

        public SearchingPeopleFormArguments Arguments { get; set; }
    }
}
