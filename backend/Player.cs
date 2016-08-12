using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyBox_Backend
{
    public class Player
    {
        public string playerName;
        public double playerCash;

        public Player(string name, double startingCash)
        {
            playerName = name;
            playerCash = startingCash;
        }
    }
}
