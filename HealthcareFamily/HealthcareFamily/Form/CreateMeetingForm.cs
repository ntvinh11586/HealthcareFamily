﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//using System.Windows.Forms;
using MetroFramework.Forms;
using HealthcareFamilyGUI.FormArguments;

using MetroFramework;
using HealthcareFamilyGUI.BUS_Webservice;

namespace HealthcareFamilyGUI
{
    public partial class CreateMeetingForm : MetroForm
    {
        public CreateMeetingForm()
        {
            InitializeComponent();
        }

        HF_BUS_WebserviceSoapClient bus;
        public CreateMeetingForm(CreateMeetingFormArguments arg)
        {
            InitializeComponent();
            Arguments = arg;
            bus = new HF_BUS_WebserviceSoapClient();
        }

        private void cmdOK_Click(object sender, EventArgs e)
        {
            if (cbDoctor.Items.Count > 0)
            {
                string email = cbDoctor.SelectedItem.ToString();
                DateTime date = dtTime.Value;
                string hour = cbHour.SelectedItem.ToString();
                string minute = cbMinute.SelectedItem.ToString();

                string time = date.ToShortDateString() + " " + hour + ":" + minute + ":0";

                
                bus.CreateAppointmentSchedule(Arguments.Username, email, time, txtDetail.Text);

                this.DialogResult = System.Windows.Forms.DialogResult.OK;

                this.Close();
            } else
            {
                MetroMessageBox.Show(this, "Please select a user!", "Error");
            }
        }

        private void cmdCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void CreateMeetingAForm_Load(object sender, EventArgs e)
        {
            cbHour.SelectedIndex = 0;
            cbMinute.SelectedIndex = 0;

            
            

            if (Arguments.SelectedUsername == null)
            {
                List<FollowerDTO> listFollower = new List<FollowerDTO>(bus.GetAllFollowerIsFriend(Arguments.Username));

                if (listFollower.Count > 0)
                {
                    foreach (FollowerDTO follower in listFollower)
                    {
                        if (follower.Relationship == "Doctor")
                        {
                            UserDTO user = bus.GetUserInformation(follower.FollowerUsername);
                            cbDoctor.Items.Add(user.Email);
                        }
                    }
                    if (cbDoctor.Items.Count > 0)
                        cbDoctor.SelectedIndex = 0;
                }
            }
            else
            {
                UserDTO doctor = bus.GetUserInformation(Arguments.SelectedUsername);

                cbDoctor.Items.Add(doctor.Email);

                cbDoctor.SelectedIndex = 0;
            }

        }


    }
}
