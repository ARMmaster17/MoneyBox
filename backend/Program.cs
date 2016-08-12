using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoneyBox_Backend
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("MoneyBox Backend Alpha");
            Console.WriteLine("Starting up...");
            bool configUseBunny = hasOption(ref args, "bunny");
            if(configUseBunny)
            {
                Console.WriteLine("Starting up AMPQ Bunny client.");
                // TODO: Bind to AMPQ client DLL.
            }
            List<Player> players = new List<Player>();
            bool configAddAI = hasOption(ref args, "add-ai");
            int configAICount = 0;
            if(configAddAI)
            {
                configAICount = getOptionParameter(ref args, "add-ai");
                Console.WriteLine("Setting up {0} AI players.", configAICount);
                // TODO: Initialize AI players.
            }
            bool configServerMode = hasOption(ref args, "no-interactive");
            Player consolePlayer = null;
            if(!configServerMode)
            {
                Console.Write("Name: ");
                consolePlayer = new Player(Console.ReadLine(), 0);
                Console.Write("\n");
            }
            Console.WriteLine("Simulation world setup starting.");
            int cycleCounter = 0;
            if(consolePlayer != null)
            {
                players.Add(consolePlayer);
            }
            /////////////////////////////////////////////
            Console.WriteLine("Simulation world setup complete.");
            while(true)
            {
                cycleCounter++;
                Console.WriteLine("Cycle {0}", cycleCounter);
                if (configAddAI)
                {
                    // TODO: Loop through all AI players.
                }
                if (configUseBunny)
                {
                    // TODO: Check bunny ampq queue.
                }
                if(!configServerMode)
                {
                    while (true)
                    {
                        Console.Write("> ");
                        string command = Console.ReadLine();
                        Console.Write("\n");
                        if (command.Equals("exit"))
                        {
                            return;
                        }
                        else if(command.Equals("endturn"))
                        {
                            break;
                        }
                        else
                        {
                            string[] commands = command.Split(' ');
                            if (commands[0].Equals("list"))
                            {
                                if (commands[1].Equals("players"))
                                {
                                    Console.WriteLine("Name\tMoney");
                                    foreach (Player p in players)
                                    {
                                        Console.WriteLine("{0}\t{1}", p.playerName, p.playerCash);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        private static bool hasOption(ref string[] args, string arg)
        {
            arg = "--" + arg;
            for (int i = 0; i < args.Length; i++)
            {
                if(args[i].StartsWith("--") && args[i].Equals(arg))
                {
                    return true;
                }
            }
            return false;
        }
        private static int getOptionParameter(ref string[] args, string arg)
        {
            arg = "--" + arg;
            for (int i = 0; i < args.Length; i++)
            {
                if (args[i].StartsWith("--") && args[i].Equals(arg))
                {
                    return Convert.ToInt32(args[++i]);
                }
            }
            throw new Exception();
        }
    }
}
